Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4291D51335E
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 14:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbiD1MO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 08:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbiD1MO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 08:14:57 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61AAAD135
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 05:11:42 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id l7so9184603ejn.2
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 05:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7j/IXCZRNwKocFzMTKoZXWUGv8T3gbG86BHWdxVdnY=;
        b=ltewfHoQK0n3nI4gRBczZ9EbdfSC9Qo9aPF4PcwDlsZH1FhQjWslXPMFvzvNhfxo5I
         pW2Xeic48XeMRxkTsYXDF/Dbck/YyaKpu4c2F+a9im8RXGbeMtamA+khhx7sh7b3ZMuw
         aVMigur+rwXLMNnNx22tTLSqp4io7cekV6iTOAmcenBRZWQ4C41rQdwrYG3VFi7cqPWs
         Kchhit0DDopEKumjEt3lEmumvho+/bMdR0YOeCdq2gtNx2UgXE5iGutm4zkHEUorR3Rc
         Fewp0kuSou5O0vzHdhx4UAGrkS116U7xFPtY8Afwutf5y02I0tBEfQFmzNe9k7VSxD6h
         xiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7j/IXCZRNwKocFzMTKoZXWUGv8T3gbG86BHWdxVdnY=;
        b=K0vkvgXAwWdHMq/eA7ghS7D/HqtyPKPjiEvtkIpDO6OnZKIHqZQQkTOKvl2Vl6kf5f
         MnCEGhQFcziX2EZkXFXi8i2wgqv1n8hBeddaK9FIYf0Ds64kUATh6gpUkyL7ydHZQmtR
         GCJZEE/slpeIxHjIZfgsUOHh7wIhnUC+02OjrI+HhIU6s0bEfkyTy63UShxR9fy8nlb8
         sfvB773KguRdYAqqCOpjspRuP3qGFyf1lwHKm09umO53slO0HYe2FjTrgQouT05i11jK
         wKlumL6sQ69TopbVQNo9qWNS0ql+SWJ3ehGnk5vrlQAqzA98BxSIdhgRc5oEY4Qnun7Q
         q2kg==
X-Gm-Message-State: AOAM530w9qNIVoqcEzBB0J1zNNjulZ766/pjpUaxst0mGTqErkGR67px
        WDxR+TnEKyQ/YTBaTFPxIFapwjs5mqgIiw==
X-Google-Smtp-Source: ABdhPJxQYGrMfrAGGN+Vu+8O1xE1Qy1ARxa8uH0kKYWmhgYlLeC1QvyK1MqBMzTIY5AHX1ViiTPE2Q==
X-Received: by 2002:a17:906:c113:b0:6d7:7b53:9cb with SMTP id do19-20020a170906c11300b006d77b5309cbmr32274865ejc.197.1651147901236;
        Thu, 28 Apr 2022 05:11:41 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709066d8700b006d4b4d137fbsm8296207ejt.50.2022.04.28.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 05:11:40 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>, wens@csie.org,
        frattaroli.nicolas@gmail.com,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Hantro JPEG Encoding Padding Bug
Date:   Thu, 28 Apr 2022 14:04:00 +0200
Message-ID: <2351438.KPpaG06aq8@archbook>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

yesterday I enabled the Hantro JPEG encoder on my RK3566[1], and noticed
a peculiar thing: when encoding a 1920x1080 video[2] with gstreamer
through the hardware JPEG encoder using v4l2jpegenc, it'd result in a
1920x1088 output with a green bar at the bottom[3].

I asked on the #linux-media IRC channel on OFTC about this, and was told
by Nicolas Dufresne (hello, fellow Nicolas!) that I should post to this
list to make sure this doesn't fall through the cracks.

The kernel used was based on 5.18-rc4, and the GStreamer version is
1.20.1.

The GStreamer command used was:

gst-launch-1.0 filesrc location=panduroll.mp4 ! \
               qtdemux name=demux demux.video_0 ! decodebin ! \
               videoconvert ! v4l2jpegenc ! matroskamux ! \
               filesink location=pandu_but_mjpeg.mkv

Regards,
Nicolas Frattaroli

[1]: https://patchwork.kernel.org/project/linux-rockchip/list/?series=636371
[2]: https://overviewer.org/~pillow/up/cd92d13cc0/panduroll.mp4
[3]: https://overviewer.org/~pillow/up/f46371b207/pandu_but_mjpeg.mkv


