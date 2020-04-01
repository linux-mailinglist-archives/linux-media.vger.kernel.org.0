Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E4719A94B
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 12:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbgDAKR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 06:17:29 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39333 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725860AbgDAKR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 06:17:29 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JaR2jEDSffHuvJaR5jDu6b; Wed, 01 Apr 2020 12:17:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585736247; bh=12Atz1MMPMZ59ChnMc42yXHkHhF4W4mC72fe0HOjkXg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fc5s7LPvgdf8B343CMkTVBOqSuniUjsC157dqcMHhQ5Oo5WKW7Am6OzPTB8qDU3gA
         KzpfhEhOAy4LFZTVn3d4T4gWWBQDBaA2BwNzPX4OLIT2hh4O9wZ67ynQzqgXqDngj9
         4b4Edi1Qr0d1dEXz82SSPAV1iEYWIe0IGwc657NjbHDiMstG3MeXCdXJpfyv0xgRZ9
         dvEY77yf4zXe5c5OgVZyWodPmwErLuqAG2iCsadtECoRS/VccAMvUCpcpdydIZ9Eqe
         RsAhDhZpYZ/JOT3UGGI+ixzziTft1fNQb3F9NSkHMmDH7FgvdIg/y3Fb6AowH0PwNN
         O4exIG7p3o4ww==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] hantro fixes/improvements
Message-ID: <3456eb01-c9a0-0fae-2a95-08406a3d2646@xs4all.nl>
Date:   Wed, 1 Apr 2020 12:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGUIHXFq19e658+RIdtso8g8+9Kykl8dTs/TDFxmdkKP6kBPQIBUXMdizRKMlkbpdlIrEJGat/UjDJ3KvPhE+wFRICjZNF08D5Kb5YUG8pW9d+8tmZs1
 cleC+75QESUTVLbCG9Rre85fNEOB0he8pKhsowLGsJfXV9L3LIIRx1Fb7MAqa4nwIBlJhwtlqqoX2Iq8iXwzp3iloKC8z5BFTow=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2632e7b618a7730969f9782593c29ca53553aa22:

  media: venus: firmware: Ignore secure call error on first resume (2020-03-30 11:28:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8b

for you to fetch changes up to c7db6b9c34c68b19767ceb9dfd6e116698122695:

  dt-bindings: rockchip-vpu: Convert bindings to json-schema (2020-03-31 15:37:49 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (7):
      v4l2-mem2mem: return CAPTURE buffer first
      hantro: Set buffers' zeroth plane payload in .buf_prepare
      hantro: Use v4l2_m2m_buf_done_and_job_finish
      hantro: Remove unneeded hantro_dec_buf_finish
      hantro: Move H264 motion vector calculation to a helper
      hantro: Refactor for V4L2 API spec compliancy
      dt-bindings: rockchip-vpu: Convert bindings to json-schema

 Documentation/devicetree/bindings/media/rockchip-vpu.txt  |  43 -----------------
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml |  74 +++++++++++++++++++++++++++++
 MAINTAINERS                                               |   2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                    |  11 ++++-
 drivers/staging/media/hantro/hantro.h                     |   7 +--
 drivers/staging/media/hantro/hantro_drv.c                 |  28 ++++-------
 drivers/staging/media/hantro/hantro_hw.h                  |  31 ++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c                | 111 ++++++++++++++++++++++---------------------
 8 files changed, 185 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml
