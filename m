Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9E037398F
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhEELiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:38:25 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48469 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232917AbhEELiX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 07:38:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eFqElLscqWztCeFqIlL6qg; Wed, 05 May 2021 13:37:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620214646; bh=5iRJzA5kEubJp60F25EMFuTMRaHhlBLtQf10r4ujFDw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=E2+tadw+If8QahzYHZRLjSbceOVG+BSoWhmr+6HXnmz8DeRgl7E3BqlFZOSihHfSd
         KPJ9wcQFzgOi2Liq+1NYMdGNxSHzhloP2gG9bt2GnSgOir0oZZWsru/kzCIAYobRPF
         zleT2vNWPvxdx2ZbgY/CBfp6XbQIJhisCi786wxZtmNcy1Eg71U+YdpzuIdsEAO0Vq
         ttGJ3yNVAiEZrqajxI32jFogagXn4z112nQ7ppUgEeMvBpiAv/A6UO2GboSrcS8QUg
         C4eDnbVj/HTA9WsVrt+cr2kgs3AJaM0K4jzTpB+Phb3u7t72zcKMWu3esKDCjEfGEJ
         VZDxwlqffA5fw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.13] Three fixes for 5.13.
Message-ID: <e2d6324c-b001-7468-2eb6-3df9f044ae8c@xs4all.nl>
Date:   Wed, 5 May 2021 13:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFNApQPBdB//fqwok0bU2VA+cDIffV4mg2Rupm/p1ToXD8bKUpnNIdhRHFWRndwWrdUel3tnBRKs4EMsOgLKvgN3cnu4VTX0OQtXnhQV87rg91LJO6oP
 2mDt9NYECshZ036KU3MJdTGjNddJM1a4VfMr+Z3tcGDXZz2mEG3HqP3z+TDd/W29P22eveMNYZXcsTxrEQyXvfWtv1kpULptn0jX+E/SAggSe01SdKW3pXKz
 tUrzljgW8/BnOpJUqOaKeRjV5lmjg0/dj9t8ij+2Y5gXmi0vT6wIf1gyue9rPLr1bavNi9MEUT6bQIw9gUYWUw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13d

for you to fetch changes up to a3a4bedde4611ba771e3a23b1741199994cb1f66:

  media: s5p-mfc: Fix display delay control creation (2021-05-05 13:35:55 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (1):
      media: mtk-vpu: on suspend, read/write regs only if vpu is running

Marek Szyprowski (1):
      media: s5p-mfc: Fix display delay control creation

Philipp Zabel (1):
      media: video-mux: Skip dangling endpoints

 drivers/media/platform/mtk-vpu/mtk_vpu.c     |  6 ++++++
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c |  1 +
 drivers/media/platform/video-mux.c           | 10 +++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)
