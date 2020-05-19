Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D801D9536
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgESLX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:23:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:60665 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726859AbgESLX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:23:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id b0Lfj05Nt8hmdb0LijjNBe; Tue, 19 May 2020 13:23:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589887435; bh=KN6NyCNbXh9LmtRn9agmTxdAjy7eAvE4KoFhJ/M9E6s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=exbSsYJffTngD0duCBCZ84Vd+Et97Hb92/gfIGD1QhtcXOZzlKWpFaGy8EsK8bzbr
         ZDQsy9GA21mfyqrhEyIzC2xixcpvS9kdNGjsXZ4XBtTPV1ZWtCDerI7iI/3D+HYiVl
         wPicGYs32JqEwAcFXGu/tzV9YiHyHRyV7TICF9OytHV1MY6M05WuZDcpoEPipC+HpG
         cnXeNAUkFYXOLbeftraOdnQpJpASvt7+q29QwPAZpt3uGcwp5ApESjtSRnUv0pJ8RP
         lJkBN/oe8njaIly4SMbTpU7aF6g8yn3UhYZdWDPFy2CjAYG07swiUCl1+1DIbp6VKD
         Cc/pBxxwlbJvA==
Subject: Re: [PATCH v3 1/1] Documentation: media: Refer to mbus format
 documentation from CSI-2 docs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20200519112136.6122-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e5efc462-ff47-e6d4-8395-8786a68ac794@xs4all.nl>
Date:   Tue, 19 May 2020 13:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519112136.6122-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDeGnj5CBg43BMD72svolJdDDCW/zeLN+86NxeTCet/c/hjgeIdH3Eln5OjqFHv30ykGKUmTfyMZa57D53u6i7yTA9bPxjODmrsGyqIFt6XEJkSjm7CG
 zv68VTmbOCdzDxmfXiE02bVbtPtFBuYl4Xfm0oOFHhdY667arusgA5Y1rYbpQxsDzSiepnDroYyUpCJk4cLLGsMSD4qujCFYaMVWaKIUI4FI9gxMDkR96Qo/
 FTteiv75Zir/OLdacDP4dJI80u86YPhXdp0tdUF0ngA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 13:21, Sakari Ailus wrote:
> The media bus formats to be used on serial busses are documented but there
> was no reference from CSI-2 documentation. Add that now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> since v2:
> 
> - Refer to mbus formats.
> 
> - Remove other elaboration on formats.
> 
> - Fix subject (format vs. code)
> 
>  Documentation/driver-api/media/csi2.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> index da8b356389f0..310849d53d05 100644
> --- a/Documentation/driver-api/media/csi2.rst
> +++ b/Documentation/driver-api/media/csi2.rst
> @@ -10,6 +10,12 @@ the host SoC. It is defined by the `MIPI alliance`_.
>  
>  .. _`MIPI alliance`: http://www.mipi.org/
>  
> +Media bus formats
> +-----------------
> +
> +See :ref:`v4l2-mbus-pixelcode` for details on which media bus formats should   
> +be used for CSI-2 interfaces.
> +
>  Transmitter drivers
>  -------------------
>  
> 

