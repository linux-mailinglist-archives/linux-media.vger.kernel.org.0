Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9976884C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 13:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbfGOLnF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 07:43:05 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:39015 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbfGOLnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 07:43:04 -0400
Received: by mail-wm1-f41.google.com with SMTP id u25so4492246wmc.4
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=XPCXx/kUFxiW4QK/2soI6ZDjTxSuFpp9vmj8ZS1qtmM=;
        b=g3SphlvuJ80qwBKuvsGX0Dl1ql+KfYOUuvf3flBGD9GvkPisHj+DXQ+6mUMkstol8H
         pUSVOD1Fa+Lf/vJrwKuJuD0MX8nvG6JR2avPhKPjtV6shz0BgvYgULaTrruQCHJ4nxCp
         EnBb5nKonVDw0slMHMhXPtunDv0BVBb8bc5rLzgj2djpx6hEAwqut2yImxWpps8V9l1Y
         ZelRaMsouq1FtPZsqwu7o+5VZHAztwRtunpDt4x/UzsSDoxQ8LNPi68iwwGNRfRcaJQS
         bxt7SgHRsYKLmU/30seMCuk2zeZs5S3jSowJftT9cN+UMfQeLFP7YSW/saz3mnliKZP2
         ZJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=XPCXx/kUFxiW4QK/2soI6ZDjTxSuFpp9vmj8ZS1qtmM=;
        b=ZhM+cFIi2RXsKDBe6ZBXqKchgvTTqCfCP+THevy6VBvJZZD7dAFvZr4K4CTudlfr1t
         tsTNZeqXq3keDEJLAhT9OwYAFd7ZPLUC7ilIuX5HzsM4GGT7DptuATQocMTeC7kMwkgw
         vNoZoWlRWAekeR16uJBUtl0+hYZT3wLMNwNNjGcDb2W3nl73KDWagYUjdxjILiOWPxls
         /KYoOg0jOc9ZikSbVT5b3Vm1jIdiSZkHgI7+et2C27vA9AjVC9m4keuK3VYgwp1+P4RD
         FCH9Z51MbSgo+pHfMMsF9VnEFpJx10I4URW2lRL+aiSZfztLvdNhEQWPl+CV0RsrhDE6
         AJdw==
X-Gm-Message-State: APjAAAUHlnjGwIjLzyfBe3MyH06SMQ/GtGpc/s7P+cvsbRLhCO6ocudk
        NjkLrL7Wm8msEn83HVDlcjOGNaAQ
X-Google-Smtp-Source: APXvYqxsj/B11y3mehvjxvBSJDYGiq83XzOSvXZd+zdw3pdfKtwXMj+GILBI9/g4TnW/V3k38i0eJg==
X-Received: by 2002:a05:600c:2385:: with SMTP id m5mr22703514wma.4.1563190982023;
        Mon, 15 Jul 2019 04:43:02 -0700 (PDT)
Received: from [192.168.197.233] (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id i12sm7633965wrx.61.2019.07.15.04.43.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 04:43:01 -0700 (PDT)
From:   Laura Nao <laura.nao@kynetics.com>
To:     linux-media@vger.kernel.org
Subject: Help with OV5640 camera and Bayer format
Message-ID: <72d64ea4-1cf1-bce2-1ae4-1f0077a961dc@kynetics.com>
Date:   Mon, 15 Jul 2019 13:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I'm trying to enable RAW format on a ov5640 camera. I'm using a custom 
imx8mm based board, with a 4.14 kernel based on the 
rel_imx_4.14.98_2.0.0_ga branch from nxp. I tried capturing some RAW 
frames using v4l-utils using the following commands:

- RAW8: v4l2-ctl -d /dev/video0 --verbose 
--set-fmt--video=width=2592,height=1944,pixelformat=BA81 --stream-mmap 
--stream-count=1 --stream-to=raw8_2592x1944.raw

- RAW10: v4l2-ctl -d /dev/video0 --verbose 
--set-fmt-video=width=2592,height=1944,pixelformat=BG10 --stream-mmap 
--stream-count=1 --stream-to=raw10_2592x1944.raw

When a RAW frame is captured, a bunch of CRC errors shows up in the 
kernel log, like the ones below:

     6,15197,289730726,-;mxc_mipi-csi.0: CRC Error: 1
     6,15198,289730734,-;mxc_mipi-csi.0: Frame Start: 1
     6,15199,289730738,-;mxc_mipi-csi.0: status: 01000002
     6,15200,289730773,-;mxc_mipi-csi.0: CRC Error: 2
     6,15201,289730778,-;mxc_mipi-csi.0: status: 00000002
     6,15202,289730795,-;mxc_mipi-csi.0: CRC Error: 3
     6,15203,289730799,-;mxc_mipi-csi.0: status: 00000002
     6,15204,289730809,-;mxc_mipi-csi.0: CRC Error: 4

Resulting images are completely garbled. This happens for both 8-bit and 
10-bit formats. Currently I'm trying to get this working with 8-bit 
mode, before moving on to 10-bit. Capture in YUV format works fine.

For reference, I'm using ov5640_mipi_v2 driver for the camera, which I 
modified to add register configuration for RAW mode and support for the 
MEDIA_BUS_FMT_SBGGR8_1X8 format. The ov5640 registers I set for enabling 
RAW mode are:

0x3034 = 0x18  // 8-bit mode
0x4300 = 0x00  // Output data format: RAW BGGR
0x501F = 0x03  // ISP Format: ISP RAW (DPC)

Drivers used on the board for the MIPI CSI layer are mx6s_capture.c and 
mxc_mipi_csi.c .

Does anyone have any insight on what might be causing these errors?

Any help would be appreciated!

Best,

Laura
