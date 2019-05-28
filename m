Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 016A42C16E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 10:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfE1Iel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 04:34:41 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53123 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726826AbfE1Iek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 04:34:40 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VXZ7hgpQIsDWyVXZ8hcDIv; Tue, 28 May 2019 10:34:38 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/2] v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
Date:   Tue, 28 May 2019 10:34:35 +0200
Message-Id: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI9l6tLUfrUuVQofcLgE1S8ygrzy3IcIo+YkQYMmM6MfCekDOGXi/ihiQqP9b6udegUPzWcZ/p4CuSXGhNMi6DU4FS3J2OstAqtpgTCqju9X3EMLAxZm
 cshT2EpTyY0W3a9VEh5bjakARxTQBzRgXcp0Q2ZmgYKLpYBiGtR0HskBzCmy+PW8A+TJZhGJNKXCSJWy8x6V5Ftdhcy0GSbnlUNwxeaczh4v/A1PJVdRBsQW
 hdFlrtsl/yFzyV2hHJ1l4RM2heXpmVRTIu8BI8FTi6jTuEw383hm1IBpCKrTc43XV1D039oAofHsyzi+7pp+vlnIP9VclEZCaqDvX4NN5ZCRUj/gpIIi/PjH
 YVoUBWY+8Jx68EceS/aQfZ38ZVKsy/kQl7qPL1q5ClcZk0IKulQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The implementation of these two ioctls is the same for all codecs, so
add helper functions for this, rather than re-implementing it for all
codecs.

Regards,

	Hans

Hans Verkuil (2):
  v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
  vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs

 drivers/media/platform/vicodec/vicodec-core.c | 35 +++----------------
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 32 +++++++++++++++++
 include/media/v4l2-mem2mem.h                  |  4 +++
 3 files changed, 40 insertions(+), 31 deletions(-)

-- 
2.20.1

