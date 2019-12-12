Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18F111CD96
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbfLLMyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:54:23 -0500
Received: from mail2.skidata.com ([91.230.2.91]:20914 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729257AbfLLMyW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:54:22 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Dec 2019 07:54:22 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1576155262; x=1607691262;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=CeP9xLEzQPGjS8P8hHC5BLd1UCEi49a28dXbvXBRo7E=;
  b=pdD1qBIIV2Zs3tDVUrSv4Vv5dZ/iB6IEjkkqR14oBfjCVY5wuw17jrgR
   V3z26clUN7WE4lq1eN1cepTx3rZYhyUywaKqekVN8e0dwUub60K1Jd1VE
   FhfgOh50OWH+l3aP47vC6tnsGkwkKvDqKx5mXZdxASktCL3F4xX14+9bP
   kdyGrgUod5hdaiILgFiW3TeShCFJty4+vsPcHvAg5QFAH1PJE2hV304+q
   z1Kzn4fWOo7iipwruemY+WRHA2ebA31/XqDrgq3hmwiECKYmkvatq/gzm
   n1D6Ry8WpVGRTN+PZ0TYXHp0KZARs9/XCoyodZISMDqtNnSf7VljBwGTw
   A==;
IronPort-SDR: YyL4FbLM+gVa4IrkZzSI5Tk3BVDyDdd8ufvjXFieYwOtZLUmNylagJgWqdUsyULahBYBN5G3uP
 hdBBODqqZdnaNrnFmtziQU3x+7kHFZOthY6P3tw5przT2spglkJ7GcVvKC3Fi1Uv8GK87Jf7Lm
 F71VbemB314ZTzX99/XC8itDkE2ei3Gk6fxTMQt/ma67gyFqSsQRUlvg1il4T2DW2sjb5f6lIi
 16Z2kvXw9W+j2rXoTfJTdOKCCxHGbDg1uwn6GojRMtOLwhd0PkCcAkJgsWCpnUUYIqiAhRoFRc
 UCM=
X-IronPort-AV: E=Sophos;i="5.69,305,1571695200"; 
   d="scan'208";a="2458609"
Subject: Re: [PATCH 4/4] media: coda: jpeg: add CODA960 JPEG encoder support
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>
CC:     <kernel@pengutronix.de>
References: <20191113125824.19547-1-p.zabel@pengutronix.de>
 <20191113125824.19547-4-p.zabel@pengutronix.de>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <b65a18e8-c66f-8e6c-71a5-6c025297e283@skidata.com>
Date:   Thu, 12 Dec 2019 13:47:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191113125824.19547-4-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,
thank you very much for this series!

On 13/11/2019 13:58, Philipp Zabel wrote:
> This patch adds JPEG encoding support for CODA960, handling the JPEG
> hardware directly. A separate JPEG encoder video device is created due
> to the separate hardware unit and different supported pixel formats.
> While the hardware can not change subsampling on the fly, it can encode
> 4:2:2 subsampled images into JPEGs of the same subsampling.
> 
> There are two additional tracepoints added to the coda driver that can
> be used together with the v4l2:v4l2_qbuf and v4l2:v4l2_dqbuf tracepoints
> to to follow video frames through the mem2mem device when encoding or
> decoding with the CODA960 JPEG codec:
>      coda:coda_jpeg_run
>      coda:coda_jpeg_done
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/media/platform/coda/coda-common.c |  41 +-
>   drivers/media/platform/coda/coda-jpeg.c   | 685 ++++++++++++++++++++++
>   drivers/media/platform/coda/coda.h        |   2 +
>   drivers/media/platform/coda/trace.h       |  10 +
>   4 files changed, 736 insertions(+), 2 deletions(-)
> 

I've successfully tested this series for 1920x1080 30fps MJPEG encoding 
on top of the 5.4.2 kernel with custom i.MX6DL and i.MX6Q boards.

Therefore feel free to add:

Tested-by: Richard Leitner <richard.leitner@skidata.com>

regards;richard.l
