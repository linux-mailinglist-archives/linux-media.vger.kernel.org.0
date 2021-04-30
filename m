Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0516436FEE1
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhD3QtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3QtE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:49:04 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D72C06174A
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 09:48:14 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id n2so18129302wrm.0
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=7XKDFC+WkZ0i9x5iFscbR7Shgv/Mp6P0b+8iJHi1RAA=;
        b=XQC0icDKm2jZXmF1Uzk8XY1pMe1VQmq3XPFalXkkTSCoM9hshRbG0aUsH15g4B4BRs
         TiloDxVlAqJCfD1qoEBrM6yMt95Q8IL/EdYKH9NLhd9st5RxJq0q6tqgRAMW2p1ZfQZh
         ODjwEYi9tSev2K/fNQXmVXC27exeMTJmdPTyTbr0d5/QFOd4ls0zr+msMn0PmRbrfCki
         68yExXNo+9cfzM2DDlkw+l23yxpSJUBGKu0MVGSvbZ+kEvrjPtux/hlyRuHKeHhC6lp0
         zeZaOFIxonQLBoQBmRmxwniVBDXQKtSdtYBhSaNlilBCZiFNdOFZ001OwhT28xZL3rvh
         7B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=7XKDFC+WkZ0i9x5iFscbR7Shgv/Mp6P0b+8iJHi1RAA=;
        b=ewx38IRD2LcoJGKjTPcD47Hhp778yJJXbzKg/yVd4odzt2EjP05kTvsNQz/f7da1uJ
         32O5X7wHXIzEUbgRvpDlz5nqNKq+OVhEdAsjy6J8mIpn9GDlg2eatkmi6qZX7aLeZ8lY
         FT3Nm3VZ25FLK0hvSUPKD7k2ScWgXlV66qZbyHe7ZJVsoiT3V7KD10VyhXW+ems06wcQ
         ppxanpXpj/osYpBLFrm2FKamqxYYEntAkw0vYeYb9zvLyF9vFwSd91ZDY1ZvuJVrdjKt
         6nKPHdos/B3SIq/dW3GlmxiZDRW8BdIcW9IWcUEMNCuDFwGpNPMT1GwcijgdqjiuD9E+
         a5gA==
X-Gm-Message-State: AOAM532UBAXyLFAEjMamPum57V1rgH6orByjPyJw3rXFeha1vVi6+yHk
        3d1V25Pvhae7tD0/SdhWA0PBX+SO20WXJg==
X-Google-Smtp-Source: ABdhPJwr+JimK9RDKUE2G//21+R4zxaTLLOEQB43fMwREuE35E85a02XrdxCTKTfQQ9R31IBhahFWQ==
X-Received: by 2002:a5d:4308:: with SMTP id h8mr7922044wrq.371.1619801293572;
        Fri, 30 Apr 2021 09:48:13 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id a142sm14193289wmd.7.2021.04.30.09.48.12
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 30 Apr 2021 09:48:13 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, ezequiel@collabora.com,
        =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: [PATCH] media: hevc: Add sps_max_sub_layers_minus1 to v4l2_ctrl_hevc_sps
Date:   Fri, 30 Apr 2021 17:48:13 +0100
Message-ID: <dbco8ghdj1a934s737s9auegilbvafdjpl@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sps_max_sub_layers_minus1 is needed if the driver wishes to determine
whether or not a frame might be used for reference.

Signed-off-by: John Cox <jc@kynesim.co.uk>
---
This is useful to the Pi H265 decoder as it allows it to only create
and store MV info for frames that need to.

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 +++
 include/media/hevc-ctrls.h                                | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b0de4e6e7ebd..9a891202abbf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2924,6 +2924,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``chroma_format_idc``
       -
+    * - __u8
+      - ``sps_max_sub_layers_minus1``
+      -
     * - __u64
       - ``flags``
       - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index b4cb2ef02f17..b2d296b77653 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -75,8 +75,7 @@ struct v4l2_ctrl_hevc_sps {
 	__u8	num_short_term_ref_pic_sets;
 	__u8	num_long_term_ref_pics_sps;
 	__u8	chroma_format_idc;
-
-	__u8	padding;
+	__u8	sps_max_sub_layers_minus1;
=20
 	__u64	flags;
 };
--=20
2.25.1

