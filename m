Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99753231121
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 19:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732093AbgG1Rut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 13:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732086AbgG1Rut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 13:50:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB766C061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 10:50:48 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id w17so15520556otl.4
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 10:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=aevcg6m/0E3lfT82FwHI+4XHan17JDlhkyBqd/sOykw=;
        b=D98A/SZ4C35cljNx2y2VSUPVGtCwZ22C0yOMx6jYsNbv2F9RCEc7+Z6/u5Up9mWm1+
         j0uB1G4pZFJG79aJJ73zk0dFVv8NyleoXNTORGfBFanY1W5/VViaOJd8JEgcomsEzSAO
         fEZMapSwcBSIWFZJIMe4+bUVPq/8xNCcEaF/+qhke/0E64VYdZj4VrXCjvmElWCyEBES
         lteRL+sk9ih7+K4DISYrJRch/MFzz9mhUnou9AViyou7lIColdrn/kto/J2fq2TXY2tN
         npG3UUzYe1V9Xy/Dz7UmQRfZWW3OY9w2ytox1T42inr5FVn8am0w4f3gRd0aHw3stXYB
         /+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=aevcg6m/0E3lfT82FwHI+4XHan17JDlhkyBqd/sOykw=;
        b=A04pAXZUtTcd953H10mY3R4HYkxMq/ktdzGqsdzzbZorooPEGZzwSpnBwaRuUl7UwS
         vnxPcgzKhfcbVxuAg+OKO1uYl9pQqmGYQ1piiz8R3F7FNTt9/8QBxmCWijx7RGNM2pAF
         lneF9t6NeduyvOkCyocmPNnIHkjonOhItEwgszogMoqPICYfNzNynGXuTr3jF8ADa8tp
         xcxOzbab5abAQzrEWa1dkGcHTEhrWEAzu3Dy3gQ1U7bX0vEXzZ+Wq9xff2xzfxzSQaJm
         PfQQ4r6pbt3x2xV2oWCgynd0Pve3HPU86dN2+5HhPWVN8XSIFAydI/IcXgn0QtYp7rbH
         d+VA==
X-Gm-Message-State: AOAM5339XQDd2KxP0qkkVp/NWucYmftyMRM5KHMwl15kSAP+VpLQqz62
        4JRAnqD4gtsoJvv7cYwRqBgTZjIo0KBfcLEr5JQ=
X-Google-Smtp-Source: ABdhPJwEAbQZ+HotGSjcc45g8HrKwq9wF4td6pnFg0pPEZs/3AZby9jlf9PBOoOwxNgq6pzb+ucIF7SXrTJo9Lq6mYA=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr24561149oti.88.1595958647700;
 Tue, 28 Jul 2020 10:50:47 -0700 (PDT)
MIME-Version: 1.0
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 28 Jul 2020 18:50:21 +0100
Message-ID: <CA+V-a8vt1HEhJzc4jN22=7PnVrkcKjzFx7Q9E1ZK-YAtc09q0w@mail.gmail.com>
Subject: [Query] OV5640 DVP and BT656 modes
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am currently investigating adding support for the BT656 format which
is currently missing in the driver.

The platform which I am currently testing can support both 8-bit DVP
and BT656 modes.
* Testing DVP mode capturing 320x240, 640x480 worked  OK with random
green lines in-between

Following is the chunk of code which enables BT656 support,  (for
BT656 mode ov5640_set_dvp_pclk() is used), with the below changes I
can get 640x480 working

#define OV5640_REG_CCIR656_CTRL00    0x4730

static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
{
    int ret;

    ret = ov5640_write_reg(sensor,
                   OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
    if (ret)
        return ret;

    ret = ov5640_write_reg(sensor,
                   OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
    if (ret)
        return ret;

    ret = ov5640_write_reg(sensor,
                   OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
    if (ret)
        return ret;

    return ov5640_write_reg(sensor,
                OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
}

As soon as I change the code to below to disable the data pads on
stream OFF as below it stops working!

static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
{
    int ret;

    ret = ov5640_write_reg(sensor,
                   OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
    if (ret)
        return ret;

    ret = ov5640_write_reg(sensor,
                   OV5640_REG_PAD_OUTPUT_ENABLE01, on ? 0x7f, 0);
    if (ret)
        return ret;

    ret = ov5640_write_reg(sensor,
                   OV5640_REG_PAD_OUTPUT_ENABLE02, on ? 0xfc, 0);
    if (ret)
        return ret;

    return ov5640_write_reg(sensor,
                OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
}

Looking at the datasheet [1] I don't find it wrong or is there any
information missing in this freely available datasheet.

Ideally BT656 mode should just work in DVP mode by setting 0x1 in
0x4730, but doesn work.

Is there anything  I'm missing here, any thoughts ?

[1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

Cheers,
--Prabhakar
