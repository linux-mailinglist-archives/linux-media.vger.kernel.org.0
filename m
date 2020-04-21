Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02DF1B284D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgDUNoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:44:19 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46805 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728745AbgDUNoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:44:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QtC4jlYNblKa1QtC7j15or; Tue, 21 Apr 2020 15:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587476655; bh=nzCZ64gPxIoM/j+JyeXGQ/ySy+plAMu9pIDfwkwYt6c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MGvCzKGiVXtR3xzMsKksuQC2abAPuOsl2d2sj01xJtAkH2mGZl6f9J+LipDrhUCFi
         fq+M033mKeIBN/bzdy5L+czBCVqGYxJalyfsrZIG1ZbkJAboJnZSKopzP/pp+uq4ZX
         SVrwC3v9uMwJJP99JV+o7mTCn2s4xiog/QixFL3SkaX3vT4opaUS2t71JNKe/ml652
         tnwmcg9wzldpnL2jMIV2aFJHPo+HgMjghCvvB27bX4Z9xGJ2CbXUkKMh8IctY9sG57
         B/2AmLr7CN3tqPwJSZPI++qWO5ahCzVxD23ys1C2rbMflHA7krh4qqPcqLPGjwzckq
         eTOxTjOQxnMhQ==
Subject: Re: [PATCH v4] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de
Cc:     ezequiel@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh@kernel.org
References: <20200326191343.1989-1-ezequiel@collabora.com>
 <12f6d7cf-6af6-4f54-3188-65e73b703a72@gmail.com>
 <9328212d-139f-6a0e-7d0c-3a5529a392f2@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <30717aac-f589-ffbd-aefb-07c2934f7a2e@xs4all.nl>
Date:   Tue, 21 Apr 2020 15:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9328212d-139f-6a0e-7d0c-3a5529a392f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFOD3+wi8uRwj+8VMeKVJAVRmyaCf97nXh7DTYhJ/GTwnfn03wdMnQ2R6vwD2I2C30SNPt/yaF2SYIz2mc8V60m9aOERfxj+viHcuNDmX49kufGAyme4
 jBztzH57g3sFqQRuyxXEqwOWEsd0WEt3+jmlj0d7nLVV65O5lyqM5wUCkwNEJ0XMLt99HovguvLNV59IHn3rbKjIiEqP1gcS8ufKXbrfChZYzkQIRYCH59kN
 ddpzFS70DPlLbjMJqNZ8T0HheZVn5xGR8I05J5FbJzkvHxLpt8RI2RGGWYzR8v6f9P4xWdv3ZKq3V54jq0CHyR+lMIszB9qhNpzIfKYGcnuC/IAAMf2DkVkG
 ie6RUDNMi5+rrv3bqy2YyWDpoW3DSN6yLERrBy/TK9jIK1rILzwPdD/xqhJfdwu+i42mp0b+38cdCbwkYiRNTO9/S040gWLnoIJ7fxPtFKk1sQKcX+0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2020 15:19, Johan Jonker wrote:
> Hi,
> 
> Question for the media maintainers Hans & Co. :
> 
> What's nxp,imx8mq-vpu.yaml doing under rga?
> Why is rockchip-vpu.yaml inserted under rga instead of vpu?

That's clearly wrong. Probably my fault when trying to resolve
a conflict.

Ezequiel, can you make a patch fixing this? It's probably a good
idea if you double-check these entries to make sure I didn't inadvertently
introduce more mistakes.

Regards,

	Hans

> 
> Johan
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f0e7b4d17fcc..0cfd86594b0b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14471,7 +14471,8 @@ M:	Jacob Chen <jacob-chen@iotwrt.com>
>>  M:	Ezequiel Garcia <ezequiel@collabora.com>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>> -F:	Documentation/devicetree/bindings/media/rockchip-rga.txt
>> +F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> +F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>  F:	drivers/media/platform/rockchip/rga/
> 
> HANTRO VPU CODEC DRIVER
> M:	Ezequiel Garcia <ezequiel@collabora.com>
> M:	Philipp Zabel <p.zabel@pengutronix.de>
> L:	linux-media@vger.kernel.org
> L:	linux-rockchip@lists.infradead.org
> S:	Maintained
> F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
> F:	drivers/staging/media/hantro/
> 
> ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
> M:	Jacob Chen <jacob-chen@iotwrt.com>
> M:	Ezequiel Garcia <ezequiel@collabora.com>
> L:	linux-media@vger.kernel.org
> S:	Maintained
> F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> F:	drivers/media/platform/rockchip/rga/
> 

