Return-Path: <linux-media+bounces-13622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B102390E08A
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5E328386E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B5215B3;
	Wed, 19 Jun 2024 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iyzTKzw5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7544380;
	Wed, 19 Jun 2024 00:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756269; cv=none; b=D4cLmyxoVS1Uos2HNT6wTO9RqaPwr0kiU07fRZF+vQsquIERp5q44UOHIQzkDV6uLZ8UMS/UaS6qICBciGLwgPAhKgGfdyaAmKNZIT3SFdklpMJKcit6iOCHvyP4uGG9vDBEzesQbcT3qcyzmxUMqe44zuOj8NaopOxKD7t4Sns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756269; c=relaxed/simple;
	bh=U0/yZ4650+9J09rA8FN4rUiL40HePqyho5dz5lfvEjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StjG1B47JxsFV7kkwvTHPm7ubNfJ3qg8FZaWwO3b0+iH2DK9pMYU9cpw2LOvWWHclxCaFnkdY12Yw5+1WhbRA8SBdvg44kW9K4zWlIoQcVw6RFkUuLRZPvg7g06lDb+NrOlQYVADaqQEEqHkqPY9KPHxUeX48jjj7OQIzWk+VVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iyzTKzw5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B726E39;
	Wed, 19 Jun 2024 02:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756246;
	bh=U0/yZ4650+9J09rA8FN4rUiL40HePqyho5dz5lfvEjA=;
	h=From:To:Cc:Subject:Date:From;
	b=iyzTKzw5v9jmPcosKayY9dqi2lQJpBRBtqmuQoFOjpbSdGHTUkEgZDF/+HSp0rXne
	 X0wYNNgJNPRf55JVTzFN1fxWVcAk0s+53J8NEcqldir4HGzgnEXFQZtY7Vr0p0IFOx
	 a4V5hU6mQxQL+oW4KnQzjV7Ay7RG9DQatlm9ChnA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 00/19] media: renesas: vsp1: Conversion to subdev active state
Date: Wed, 19 Jun 2024 03:17:03 +0300
Message-ID: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series is the second version of the vsp1 driver conversion to
using the subdev active state. This version suffers from the same main
lockdep issue as v1 (see below), but I decided to still repost it as the
first 17 patches can go in already while we figure out how to handle the
lockdep issue.

The driver is fairly complex and creates many subdevs, exposing them to
userspace through subdev nodes but also controlling them from within the
kernel when acting as a backend for the R-Car DU display driver. It is
thus a good testing ground to validate the subdev active state API.

The first 17 patches are miscellaneous refactoring and cleanups to
prepare for the actual conversion. In the middle of that is patch 11/19,
which adds a function to dump a pipeline to the kernel log, which came
very handy for debugging.

Patch 18/19 is the actual conversion to the active state API. While I
tried to keep it as small as possible by handling all the refactoring in
separate patches, it's still the largest one in the series, mostly due
to the fact that the drivers creates many subdevs. If that's any
consolation, the diffstat is nice (net removal of 261 lines). Patch
19/19 is then an additional cleanup on top.

The good news is that both the VSP test suite ([1]) and the display test
suite ([2]) pass. The bad news is that lockdep complains quite heavily:

[  276.810170] ============================================
[  276.815489] WARNING: possible recursive locking detected
[  276.820813] 6.10.0-rc3-00175-g639ee34a20f1 #803 Not tainted
[  276.826401] --------------------------------------------
[  276.831724] yavta/1481 is trying to acquire lock:
[  276.836442] ffff00000ff26868 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x140/0x308
[  276.847736] 
[  276.847736] but task is already holding lock:
[  276.853581] ffff00000ff27c68 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x118/0x308
[  276.864856] 
[  276.864856] other info that might help us debug this:
[  276.871396]  Possible unsafe locking scenario:
[  276.871396] 
[  276.877326]        CPU0
[  276.879779]        ----
[  276.882232]   lock(vsp1_entity:531:sd->active_state->lock);
[  276.887827]   lock(vsp1_entity:531:sd->active_state->lock);
[  276.893422] 
[  276.893422]  *** DEADLOCK ***
[  276.893422] 
[  276.899349]  May be due to missing lock nesting notation
[  276.899349] 
[  276.906145] 3 locks held by yavta/1481:
[  276.909996]  #0: ffff00000fcaa7a0 (&video->lock){+.+.}-{3:3}, at: __video_do_ioctl+0x19c/0x5b0
[  276.918666]  #1: ffff00000fc9f418 (&mdev->graph_mutex){+.+.}-{3:3}, at: vsp1_video_streamon+0xec/0x4e8
[  276.928031]  #2: ffff00000ff27c68 (vsp1_entity:531:sd->active_state->lock){+.+.}-{3:3}, at: v4l2_subdev_link_validate+0x118/0x308
[  276.939744] 
[  276.939744] stack backtrace:
[  276.944114] CPU: 1 PID: 1481 Comm: yavta Not tainted 6.10.0-rc3-00175-g639ee34a20f1 #803
[  276.952225] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[  276.960157] Call trace:
[  276.962616]  dump_backtrace+0xa0/0x128
[  276.966391]  show_stack+0x20/0x38
[  276.969723]  dump_stack_lvl+0x8c/0xd0
[  276.973412]  dump_stack+0x1c/0x28
[  276.976747]  print_deadlock_bug+0x29c/0x3b0
[  276.980950]  __lock_acquire+0x165c/0x1b80
[  276.984978]  lock_acquire.part.0+0x168/0x310
[  276.989265]  lock_acquire+0x70/0x90
[  276.992772]  __mutex_lock+0x10c/0x4b8
[  276.996458]  mutex_lock_nested+0x2c/0x40
[  277.000396]  v4l2_subdev_link_validate+0x140/0x308
[  277.005213]  __media_pipeline_start+0x880/0xc30
[  277.009763]  __video_device_pipeline_start+0x48/0x68
[  277.014750]  vsp1_video_streamon+0x148/0x4e8
[  277.019044]  v4l_streamon+0x50/0x70
[  277.022553]  __video_do_ioctl+0x4cc/0x5b0
[  277.026583]  video_usercopy+0x3c4/0xb90
[  277.030438]  video_ioctl2+0x20/0x48
[  277.033942]  v4l2_ioctl+0xa4/0xc8
[  277.037278]  __arm64_sys_ioctl+0xec/0x118
[  277.041310]  invoke_syscall+0x68/0x198
[  277.045084]  el0_svc_common.constprop.0+0x80/0x150
[  277.049900]  do_el0_svc+0x38/0x50
[  277.053237]  el0_svc+0x4c/0xc0
[  277.056309]  el0t_64_sync_handler+0x120/0x130
[  277.060685]  el0t_64_sync+0x190/0x198

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

Of course, I'm open to other proposals.

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


base-commit: 91798162245991e26949ef62851719bb2177a9c2
-- 
Regards,

Laurent Pinchart


