Return-Path: <linux-media+bounces-693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14357F3CC4
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5E47281A9C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40115C144;
	Wed, 22 Nov 2023 04:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wBR4COJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CF2D65;
	Tue, 21 Nov 2023 20:30:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE583D9;
	Wed, 22 Nov 2023 05:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627373;
	bh=RYbmC5AmWzHD+REQuG6CDeD7N+KdWsbmoREo0yszpUM=;
	h=From:To:Cc:Subject:Date:From;
	b=wBR4COJ/ZnWDYcF2nXiPnQfrn74KPkJt1HT0XmwO2wSsx3ge2tK4DhimI1N2wVGBX
	 tiR6Gi4BDjA/eGeNbZ4TJyLGAduWH/30s/HA7blcNAip0VIE/z+U9XNHuC8sArdgwY
	 8R4dx8aSfrOPEp+N5o2RANahLu6qDvMBqpuiaFo0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 00/19] media: renesas: vsp1: Conversion to subdev active state
Date: Wed, 22 Nov 2023 06:29:50 +0200
Message-ID: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Now that the V4L2 subdev active state has been around for a few kernel
versions, I thought I would try to convert the VSP1 driver to it. The
driver is fairly complex and creates many subdevs, exposing them to
userspace through subdev nodes but also controlling them from within the
kernel when acting as a backend for the R-Car DU display driver. It is
thus a good testing ground to validate the subdev active state API.

The first 17 patches are miscellaneous refactoring and cleanups to
prepare for the actual conversion. In the middle of that is patch 11/19,
which adds a function to dump a pipeline to the kernel log, which came
very handy for debugging. I'm not totally convinced by the
implementation, so comments would be appreciated.

Patch 18/19 is the actual conversion to the active state API. While I
tried to keep it as small as possible by handling all the refactoring in
separate patches, it's still the largest one in the series, mostly due
to the fact that the drivers creates many subdevs. If that's any
consolation, the diffstat is nice. Patch 19/19 is then an additional
cleanup on top.

The good news is that both the VSP test suite ([1]) and the display test
suite ([2]) pass. The bad news is that lockdep complains quite heavily:

[   71.426677] ============================================
[   71.431995] WARNING: possible recursive locking detected
[   71.437314] 6.7.0-rc1-00061-g07565a737176 #728 Not tainted
[   71.442807] --------------------------------------------
[   71.448120] yavta/1275 is trying to acquire lock:
[   71.452829] ffff00000e538c68 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x198/0x2b0
[   71.464109] 
[   71.464109] but task is already holding lock:
[   71.469944] ffff00000e53b468 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x184/0x2b0
[   71.481198] 
[   71.481198] other info that might help us debug this:
[   71.487727]  Possible unsafe locking scenario:
[   71.487727] 
[   71.493647]        CPU0
[   71.496095]        ----
[   71.498541]   lock(vsp1_entity:531:sd->active_state->lock);
[   71.504127]   lock(vsp1_entity:531:sd->active_state->lock);
[   71.509712] 
[   71.509712]  *** DEADLOCK ***
[   71.509712] 
[   71.515632]  May be due to missing lock nesting notation
[   71.515632] 
[   71.522421] 3 locks held by yavta/1275:
[   71.526261]  #0: ffff00000fd147a0 (&video->lock){+.+.}-{3:3}, at: __video_do_ioctl+0x19c/0x5b0
[   71.534914]  #1: ffff00000fce3418 (&mdev->graph_mutex){+.+.}-{3:3}, at: vsp1_video_streamon+0xe4/0x448
[   71.544265]  #2: ffff00000e53b468 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x184/0x2b0
[   71.555958] 
[   71.555958] stack backtrace:
[   71.560318] CPU: 0 PID: 1275 Comm: yavta Not tainted 6.7.0-rc1-00061-g07565a737176 #728
[   71.568330] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   71.576250] Call trace:
[   71.578699]  dump_backtrace+0xa0/0x128
[   71.582459]  show_stack+0x20/0x38
[   71.585781]  dump_stack_lvl+0x60/0xb0
[   71.589457]  dump_stack+0x1c/0x28
[   71.592782]  print_deadlock_bug+0x29c/0x3b0
[   71.596979]  __lock_acquire+0x1664/0x2d20
[   71.600999]  lock_acquire+0x2e8/0x458
[   71.604671]  __mutex_lock+0x10c/0x4b8
[   71.608345]  mutex_lock_nested+0x2c/0x40
[   71.612277]  v4l2_subdev_link_validate+0x198/0x2b0
[   71.617077]  __media_pipeline_start+0x79c/0xb50
[   71.621616]  __video_device_pipeline_start+0x48/0x68
[   71.626592]  vsp1_video_streamon+0x140/0x448
[   71.630871]  v4l_streamon+0x50/0x70
[   71.634368]  __video_do_ioctl+0x4cc/0x5b0
[   71.638384]  video_usercopy+0x3c4/0xb48
[   71.642226]  video_ioctl2+0x20/0x48
[   71.645722]  v4l2_ioctl+0xa4/0xc8
[   71.649044]  __arm64_sys_ioctl+0xec/0x118
[   71.653067]  invoke_syscall+0x68/0x198
[   71.656828]  el0_svc_common.constprop.0+0x80/0x150
[   71.661629]  do_el0_svc+0x38/0x50
[   71.664954]  el0_svc+0x50/0xa0
[   71.668015]  el0t_64_sync_handler+0x120/0x130
[   71.672380]  el0t_64_sync+0x190/0x198

There is no actual deadlock situation caused by the tests, but a lockdep
class deadlock detection.

Subdev initialization is handled in one helper function for all subdevs
created by the driver. This causes all locks for the active state being
created with the same lock class. As a result, when validating links and
trying to lock both the sink and source states, lockdep complains of
recursive locking, even if the two locks are different mutex instances.

Working around the issue is likely possible. The
v4l2_subdev_init_finalize() function is actually a macro calling
__v4l2_subdev_init_finalize() with an explicit lock class. The VSP1
driver could do the same and push the lock class one layer up, to the
callers of vsp1_entity_init(). This would solve part of the problem
only, as the driver creates multiple subdevs of the same type, so
dynamic allocation of the lock class may be required. That would however
be a bad solution, or rather not a solution to the actual problem. There
is a reason why lockdep groups locks in classes, beside just saving
memory. When locks belonging to different instances of the same object
type are taken recursively, it is often the sign of a bad design.

Even if we worked around this problem, lockdep would later complain
about AB-BA locking at link validation time. The VSP1 entities can be
assembled in a pipeline in any order, so even if the link validation
helpers are careful to always lock in the sink-source order, the sink
and source could get swapped.

I believe this calls for a rework of locking for subdev states. The
option I'm envisioning is to lock all subdevs in a pipeline when
starting the pipeline, with a new media_pipeline_lock() call just before
media_pipeline_start(). The link validation helpers would then be called
with all locks taken, and so would the .s_stream() subdev operations.
This would simplify locking in drivers as a result, which I think is a
very desirable side effect. Then, after starting the pipeline, the
top-level driver would call media_pipeline_unlock(). Similar locking
would be performed at pipeline stop time, to ensure that the .s_stream()
operations would also be called with the locks held. Obviously, just
moving locking around won't fix the lockdep issues, and the second part
of the fix would be to use ww-mutexes instead of regular mutexes. The
result would be similar to the implementation of the KMS atomic API,
giving me some confidence that it goes in the right direction. An
additional difficulty, however, is that we need to lock both the subdev
active state and the control handler with the same lock.

Of course, this being an RFC, I'm open to other proposals :-)

In the meantime, I think the 17 first refactoring and cleanup patches
could be merged already (after getting reviewed, of course) without
waiting for a solution for the active state usage in patch 18/19.

[1] https://git.ideasonboard.com/renesas/vsp-tests.git
[2] https://git.ideasonboard.com/renesas/kms-tests.git

Laurent Pinchart (19):
  media: renesas: vsp1: Drop vsp1_entity_get_pad_format() wrapper
  media: renesas: vsp1: Drop vsp1_entity_get_pad_selection() wrapper
  media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
  media: renesas: vsp1: Drop brx_get_compose() wrapper
  media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
  media: renesas: vsp1: Move partition calculation to vsp1_pipe.c
  media: renesas: vsp1: Simplify partition calculation
  media: renesas: vsp1: Store RPF partition configuration per RPF
    instance
  media: renesas: vsp1: Pass partition pointer to .configure_partition()
  media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
  media: renesas: vsp1: Add and use function to dump a pipeline to the
    log
  media: renesas: vsp1: Keep the DRM pipeline entities sorted
  media: renesas: vsp1: Compute partitions for DRM pipelines
  media: renesas: vsp1: Get configuration from partition instead of
    state
  media: renesas: vsp1: Name parameters to entity operations
  media: renesas: vsp1: Pass subdev state to entity operations
  media: renesas: vsp1: Initialize control handler after subdev
  media: renesas: vsp1: Switch to V4L2 subdev active state
  media: renesas: vsp1: Rename all v4l2_subdev_state variables to
    'state'

 .../media/platform/renesas/vsp1/vsp1_brx.c    |  84 ++------
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  20 +-
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  48 ++++-
 .../media/platform/renesas/vsp1/vsp1_drm.h    |   2 +
 .../media/platform/renesas/vsp1/vsp1_entity.c | 202 +++---------------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  66 +++---
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |  30 +--
 .../media/platform/renesas/vsp1/vsp1_hgt.c    |  22 +-
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 116 +++-------
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  32 +--
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  18 +-
 .../media/platform/renesas/vsp1/vsp1_lut.c    |  17 +-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 111 +++++++++-
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |  48 +++--
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  60 +++---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  89 ++------
 .../media/platform/renesas/vsp1/vsp1_rwpf.h   |   3 -
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  84 +++-----
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  96 +++------
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  66 ++----
 .../media/platform/renesas/vsp1/vsp1_video.c  | 193 ++++++-----------
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  46 ++--
 22 files changed, 559 insertions(+), 894 deletions(-)

-- 
Regards,

Laurent Pinchart


