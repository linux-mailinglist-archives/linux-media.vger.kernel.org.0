Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5417E55DB
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 12:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjKHL74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 06:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjKHL7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 06:59:55 -0500
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4B1198D
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 03:59:52 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id 4DBFB303DF73;
        Wed,  8 Nov 2023 12:59:51 +0100 (CET)
Authentication-Results: ext-mx-out013.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :from:from:references:content-language:subject:subject
        :mime-version:date:date:message-id:received:received:received;
         s=dkim20160331; t=1699444790; x=1701259191; bh=ekjg9NuqwtnSQhzd
        /cLXXsV7VVwALNYtpw49WydSYzE=; b=477WKWVOD5hHx4LremIGX+Oe1eJFDLxQ
        PjASb3aim64Iteskm4E1Kn0OCqYxZ+W6GYhk6TDlnjFd5q4c6EpR8GOlBV2G1kkF
        C8Id14W3/jxGnAg3ul+CeqI9BK9cTZq7Feufq4EBzvrhKHv+T8U2S57phGDGhlRU
        2gSDJUowqP8NNCMW3KB4IlJMzgN58ey6aa5zi3reV7BYBNj0Cyi+AVAgtLdrHces
        0b//bSN79rn3IasJ9cno8C3Ar5dX70/JayIgHFZjtaoWoiZPgw6gRGsUMFOFGA5O
        HzTpXagR28KWTYT4Anh1R5mc7AjVhOva5tTIR12QerBih7cVOOb5B5Pn00sGZSCJ
        ydYc77Q1K+BEk5h5G2EtAmY7X2GmE4SUGwcF6RTHE8YUwJ4LKX0h641A8fVvd1v2
        wthc8PbDyDfTnjz5mnvtG1EFxC4mE/+8nhJlTz6GpnY7aDUvgbbKguyy7eSZ+7RP
        1yyTFQ+fxC7eHPv+mwosW31A5zZn+g9/hRMWnsipRzIy02pwH7jBizJUl9j8nlFn
        MYr4A0d1UHukTiEnaaKqaorrN0ZH/27VxkFoMJoZ/UPIxktzIUxgG+c0r65IVt2u
        ZEQxcQNTA8vOaUXE6HsDeCccgYT7Lymixun7yhucDG+qg8EZ0qBu4tG2o5bg9t3R
        SJ/7Ozo8UZc=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 tagged_above=-10 required=5 tests=[ALL_TRUSTED=-1]
 autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Aft5t8af2nL5; Wed,  8 Nov 2023 12:59:50 +0100 (CET)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
        by mx.kolabnow.com (Postfix) with ESMTPS id 6379F300D3C9;
        Wed,  8 Nov 2023 12:59:49 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
        by int-mx011.mykolab.com (Postfix) with ESMTPS id 9570A30C01F3;
        Wed,  8 Nov 2023 12:59:48 +0100 (CET)
Message-ID: <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
Date:   Wed, 8 Nov 2023 12:59:47 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US, nl
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
From:   Hans de Goede <hans@hansg.org>
In-Reply-To: <20231024112924.3934228-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On 10/24/23 13:29, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU6 input system.
> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> device which can be found in some Intel Client Platforms. User can use
> IPU6 to capture images from MIPI camera sensors.
> 
> IPU6 has its own firmware which exposes ABIs to driver, and communicates
> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> the driver sets up a page table to allow IPU6 DMA to access the system
> memory.
> 
> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.

I have been testing this on a TigerLake system, a Dell Latitude 9420
with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
which libcamera together with (WIP) software debayer support picks
by default does not work. There are many many CSI errors in dmesg
and only the first 10 or so lines of the image show.

Disabling the packed format by removing it from ipu6_isys_pfmts[],
making libcamera pick the unpacked (every 10 bits per pixel data
stored in a 16 bit word in output buffer) fixes this.

Are the packed bayer formats supposed to work on Tiger Lake, or
is this a known issue which Intel's own userspace stack avoids
by always picking the unpacked format ?

Regards,

Hans


