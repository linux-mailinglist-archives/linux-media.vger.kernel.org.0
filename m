Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6101810D9E5
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 20:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfK2TF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 14:05:56 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34936 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfK2TFz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 14:05:55 -0500
Received: by mail-pj1-f66.google.com with SMTP id s8so13647424pji.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2019 11:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Tput1dndwwpf2AerG7ygIFUf2lPuIOL1u2Rfqh3NfVk=;
        b=BvzraM8CKAkmCxfYac7IabmSaA3XEhDd8HpdyMp+V6oEIXnvMQ0HYoaW8qLnxl1Bu5
         tdCjjxeqp+1ojRgWyB0OoM6qU9D3D0jDR5RlY+o2UwpnG6igqT/FSRv/uIULFVtUuJh2
         WiNVnZbAIkyKXHxwBgcJl+Fj1e8+EOuOTj/BkpzkuFND2LlNyHcbjVO64ij5AALRU+g/
         Lt87Iaq2d5y1Xc0iUzbnFBU+13p//CszEE0d7yQaHTNAOFN7PAwEpfnLtOcR6ZpP1ZnE
         7lw7T3rVc1h4Wr6Icxk0y38/JpYdb2+oFC2z+C/Fa2bP7ew8XXKD4FJH4jWle+BK1vX3
         eSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Tput1dndwwpf2AerG7ygIFUf2lPuIOL1u2Rfqh3NfVk=;
        b=EvtqhFMJ+5Fqv8rrgmUluxfW+JRIWxioHvSE2/jqkyMCCKtmMB3WaTlgrdldG+TB0f
         ZGcdzWGDyFdsD++yfWyKYYH9Gn0MiPV4lmVLmgy7BgbQ+2xe6lzNOOG+eC5uFfAaT81x
         lGGG1YMd3IbBRiBqmQKT4y9w8RBY9Sy314VT9DLtUiW84FVdvDgL/pI62StQu1QiJc84
         wHNa6lmfkS9o95Oe1f3dTacUjoMrc+NVVH+nVRyaD/7gWMN/4g5voag84MYKJF1D2QrW
         3u8tDU431twKl0k+6Wa1121berkE9GZwY5xLTecKsjp5VfyKMuL/dr3FtOb8qtK870wA
         So+Q==
X-Gm-Message-State: APjAAAWwSmdgRYYvqENvTZuMarMZUZUH5b+jpmGwnO38qa8HCLELl33T
        XluUg+ypTc3oaH8E9V+iMuS9
X-Google-Smtp-Source: APXvYqzeLaLk5/vOg6eNz6870rE+kdGHOlazQZ3zrqxCvca4ydWQaL+eH7v+1YZ7kIhaW1TedvQLdg==
X-Received: by 2002:a17:902:fe06:: with SMTP id g6mr15355459plj.52.1575054353473;
        Fri, 29 Nov 2019 11:05:53 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:638d:cc55:d006:f721:cde2:1059])
        by smtp.gmail.com with ESMTPSA id h9sm25159974pgk.84.2019.11.29.11.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:05:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] Improvements to IMX290 CMOS driver
Date:   Sat, 30 Nov 2019 00:35:36 +0530
Message-Id: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset adds improvements to the existing IMX290 CMOS driver from
Sony. The major changes are adding 2 lane support, test pattern generation,
RAW12 mode support and configurable link frequency & pixel rate.

The link frequency & pixel rate combinations depend on various factors like
lane count, resolution and image format as per the datasheet.

Thanks,
Mani

Manivannan Sadhasivam (5):
  media: i2c: imx290: Add support for 2 data lanes
  media: i2c: imx290: Add support for test pattern generation
  media: i2c: imx290: Add RAW12 mode support
  media: i2c: imx290: Add support to enumerate all frame sizes
  media: i2c: imx290: Add configurable link frequency and pixel rate

 drivers/media/i2c/imx290.c | 328 +++++++++++++++++++++++++++++++------
 1 file changed, 277 insertions(+), 51 deletions(-)

-- 
2.17.1

