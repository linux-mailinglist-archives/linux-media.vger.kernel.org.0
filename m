Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84ADD2BAA9E
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 13:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgKTMzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 07:55:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48295 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726808AbgKTMzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 07:55:50 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g5x2krGEwWTbog5x5kg5qF; Fri, 20 Nov 2020 13:55:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605876948; bh=fT8TOUwDI1VNh7NuYUHu2ZyqVBTjKwKILAUDMRez0Ds=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FYHlx+B1RCVLL241vxKgfi/qrD06TFRljtSXg+Eqck3bY/SOY2uqe8/TLhGoo2KOB
         OYfDcK80JoRBIxpJTg4dd1kgTH+7bMqurXHKeOukl5FpkK2TXPLVypwIqEAmghjT4o
         iiruGNMp13mqGvH5FEf7kLnD6QWIu9j7Pl5a5r3HDpg0I8Y7moJ02gBfuCymyeUvBR
         bz+HOu/4K7qLJyAVLLwUF/ESpS68jqCQL2btdoMZEDqvx0lgEq6V4DAYke91hIztJK
         RlgLVITKJpCv4dZKF5Hu45Q0q/5uDm8fU6XIO1aFSqHfC1AAwWiHUyHVfPajpwilOL
         CXJyqDGnOwW1w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] Add support for SDM630/660 Camera Subsystem
Message-ID: <cf88ebe9-6898-eb0f-896f-bb8efb8bf301@xs4all.nl>
Date:   Fri, 20 Nov 2020 13:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLeJSuKAw3SHgb6z5OZ7LRi0MP3HbcX6Rcax4/l+3C8bhFH7SxY8LKsRXwR4gTCoSN3yalAt7reiKE/vJwD227TFsq79tJRZsOWidfZWHzomDrqxiM1d
 4orRpvehxKO2jP/J7vGlHe7+ywyFBCy7/r68rMgBLFOPVor4Hd6xiDt/cOwtrznszyo+A+tcog9KtdnTTLyLiegZPqfCKpra4A2oXdvFWWFW8rnk6/Pgb6lU
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9463e07df8e0f93931e32c6f415d3f82bda63f35:

  media: v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs (2020-11-17 07:14:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11a

for you to fetch changes up to 3715b314f0f01936247ee3ff9868463aaac7d4e6:

  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660 (2020-11-20 11:47:21 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
AngeloGioacchino Del Regno (7):
      media: camss: ispif: Correctly reset based on the VFE ID
      media: camss: vfe-4-7: Rename get_ub_size, set_qos, set_ds, wm_enable
      media: camss: vfe: Add support for VFE 4.8
      media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
      media: camss: Add support for SDM630/636/660 camera subsystem
      media: camss: csiphy-3ph: Add support for SDM630/660
      media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660

 Documentation/devicetree/bindings/media/qcom,camss.txt   |   7 ++
 drivers/media/platform/qcom/camss/camss-csid.c           |   9 +-
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |   7 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c         |  25 +++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h         |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c          | 100 +++++++++++++--------
 drivers/media/platform/qcom/camss/camss-ispif.h          |   2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c        | 131 +++++++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-vfe.c            |  19 ++--
 drivers/media/platform/qcom/camss/camss-vfe.h            |   1 +
 drivers/media/platform/qcom/camss/camss-video.c          |   3 +-
 drivers/media/platform/qcom/camss/camss.c                | 206 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h                |   1 +
 13 files changed, 450 insertions(+), 62 deletions(-)
