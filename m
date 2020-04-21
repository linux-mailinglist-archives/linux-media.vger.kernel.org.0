Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFF91B280C
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgDUNgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728479AbgDUNgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:36:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B49C061A10;
        Tue, 21 Apr 2020 06:36:38 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j1so11076357wrt.1;
        Tue, 21 Apr 2020 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5OQyA1IQKL66fu+SroNc2N6PhU0Vi6Th6juxgV44yhE=;
        b=WyFbMps8aAO8dbx5cDlOc3GPqsdlkgo3uwVrzOgHfhiIouuR2TPVDcbChKmSYo8PqZ
         yPB0HQ0Oumt0hawJPO+bvQfRf6YPDDPLkWCrVEAJk9bfUzBmMJgA4cSrEYFnZA6i0Iq5
         VnoQQrB6eDI+l9ZWsaeL5Ht6bRX0tiSZ+ufwKMUysD2BkRy+VaYHZrE+cOmrVpczNYOH
         bY6aVGa/DHrqlZMxUi7vUz+AVcwd5lmQhnqyk8RnoozWD5SGtXoRYrIXsXQD09MhSs8g
         bZw1ASmGPMr/Nvsx9dF5sdq7QTByTw5TLF/pH0fF978qaV3xq9Q2vUNNVV6CPk8XvOZd
         4PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5OQyA1IQKL66fu+SroNc2N6PhU0Vi6Th6juxgV44yhE=;
        b=XsVp1FUTVF/QxZ6LxcBeH74O5eveQeXE7P7FHqTfn7SsNCU7h+hBzMca7jBn9XhuDg
         eQw1YGncJdEzu0CCQ5tVoLwR8r61pDrwc7Ls/dsT+mvFjhy7d4jVtpkFhYjoifbjux3V
         p3bi1dy5oMrEAhB6uXgrs2+7Be19QV21yF0LERx5N8PV9811xBE7gzZjIon/QLJSFsCl
         qm/HOjYYYbwJtRAhcd+NLJR6SjeX+mEP9oA2J2969yCF8F53sy/iZOYJLD3m9wxJQV9/
         1yxx80x18b6ePBvFUbuwTjM/phAU/00Ape+h6JV/B0loENNOHjGCM6bwhmOEsdWa0uFO
         KC1g==
X-Gm-Message-State: AGi0PuZ6bX6FZ1aYSkJekKd9dslPPNMewzgjgdl9Q8prEic+uxWB/wMS
        mwpDBLJdd0CRkH9+TFbjOC4=
X-Google-Smtp-Source: APiQypIafTb861wTqKFVKyWjNJsxEWJwE2dYhymN5jKxCk9R4Z9mkEd2PKAJEvjPgI9Xe+SBtGWUsA==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr25202595wrc.416.1587476197392;
        Tue, 21 Apr 2020 06:36:37 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k8sm3768837wrm.52.2020.04.21.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 06:36:36 -0700 (PDT)
Subject: Re: [PATCH v4] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     ezequiel@collabora.com, devicetree@vger.kernel.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mark.rutland@arm.com, robh@kernel.org
References: <20200326191343.1989-1-ezequiel@collabora.com>
 <12f6d7cf-6af6-4f54-3188-65e73b703a72@gmail.com>
 <9328212d-139f-6a0e-7d0c-3a5529a392f2@gmail.com>
Message-ID: <0b82a3f1-3b09-15d6-927c-fac1d4a7f631@gmail.com>
Date:   Tue, 21 Apr 2020 15:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9328212d-139f-6a0e-7d0c-3a5529a392f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Also add

L:	linux-rockchip@lists.infradead.org

to all Rockchip related MAINTAINERS items.

On 4/21/20 3:19 PM, Johan Jonker wrote:
> Hi,
> 
> Question for the media maintainers Hans & Co. :
> 
> What's nxp,imx8mq-vpu.yaml doing under rga?
> Why is rockchip-vpu.yaml inserted under rga instead of vpu?
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

Add list

> S:	Maintained
> F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> F:	drivers/media/platform/rockchip/rga/
> 

ROCKCHIP VIDEO DECODER DRIVER
M:	Ezequiel Garcia <ezequiel@collabora.com>
L:	linux-media@vger.kernel.org

Add list

S:	Maintained
F:	drivers/staging/media/rkvdec/
F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml

ROCKCHIP ISP V1 DRIVER
M:	Helen Koike <helen.koike@collabora.com>
L:	linux-media@vger.kernel.org

Add list

S:	Maintained
F:	drivers/staging/media/rkisp1/
