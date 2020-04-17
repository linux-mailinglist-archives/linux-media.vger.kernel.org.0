Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BCD1AD956
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 11:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgDQJBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 05:01:00 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38375 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729974AbgDQJA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 05:00:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PMrmjiE467xncPMrpj9usY; Fri, 17 Apr 2020 11:00:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587114057; bh=7esEUB68MSV4/K/drHXG+7qEHV1oIz0bnsK7evweQAs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BLxHiI8AxPF+7BXmK8H1K1IKSxRmkAm/M3o7HhGAx0/4dSuQ3vVkRO1O48j0sy2ST
         BhYlX0/RoObbvG7JJ21nl9VnofbMzhB8OM7k4Gc2092j9hCpPemYFW2Uz7YsKmcH56
         NMeX6qWuNTZ/C4fI4oNgA5gErbtsysPuTlV1hg+IFbnFa05nCO09vlINmcKjheyKt4
         mnmYtQzPu/Xxv0E3C2xCpga8zYPBozZXPwcSwAfT/GxbrkyZoPEiowAw7/tRrrRoo0
         +nY9VzKLPuCY1nu2HQXdBcZO9fFW+Ep+TgjtSQY64QzcBHo+SxITDdbfDwi+J/z14A
         5MlCRZCcJb01w==
Subject: Re: [PATCH 3/4] media: admin-guide: Add an introduction chapter
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <cover.1587036920.git.mchehab+huawei@kernel.org>
 <73542a4587ad416b973bebc555fd6b93d40e5139.1587036920.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <83fdb70b-27f6-ca19-653a-c6f12dda3909@xs4all.nl>
Date:   Fri, 17 Apr 2020 11:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <73542a4587ad416b973bebc555fd6b93d40e5139.1587036920.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCMFlTbWTzgYGkfTpQoPErwZwKDlQo3QMKrOr71HDHLJpObOM9t4jc/lxICVAxfKvBnc6r421T3Wzrb06nEG7RAWRM+HOOinNgAS4G9bXCJr9TejCCqZ
 F2DrCf1+Jl99wR+8tDhPCS8pY/2qLDGXfRfeTy2FlHu74/0OqIBBDQtbQiKJZnpJBsaW5TTwSXDCXQP4cTS22VCAuznFbK9QtZa7CruKeS4GYdumhfrKB3UM
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2020 13:36, Mauro Carvalho Chehab wrote:
> The media's admin guide is currently just a group of
> not-connected docs.
> 
> Add an introduction chapter for it to start making sense
> to a random reader.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/media/index.rst |  2 ++
>  Documentation/admin-guide/media/intro.rst | 25 +++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/intro.rst
> 
> diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
> index 6e5e6bdb6d4b..f79d4f1e05ba 100644
> --- a/Documentation/admin-guide/media/index.rst
> +++ b/Documentation/admin-guide/media/index.rst
> @@ -34,6 +34,8 @@ Video4Linux (V4L)  driver-specific documentation
>  	:maxdepth: 5
>  	:numbered:
>  
> +	intro
> +
>  	cardlist
>  
>  	v4l-with-ir
> diff --git a/Documentation/admin-guide/media/intro.rst b/Documentation/admin-guide/media/intro.rst
> new file mode 100644
> index 000000000000..9b6399fd904f
> --- /dev/null
> +++ b/Documentation/admin-guide/media/intro.rst
> @@ -0,0 +1,25 @@
> +============
> +Introduction
> +============
> +
> +The media subsystem consists on Linux support for several different types
> +of devices:

I'd rephrase this to:

The media subsystem supports several different types of devices:

> +
> +- Audio and video grabbers;

I'd say 'Video and audio grabbers' since video is the main use-case.

> +- PC and Laptop Cameras;

I'd replace 'PC' with 'Webcams'.

> +- Complex cameras found on Embedded hardware;
> +- Analog and digital TV;
> +- HDMI Customer Electronics Control (CEC);

Customer -> Consumer

> +- Multi-touch input devices;
> +- Remote Controllers;
> +- Media encoders and decoders.

Add:

- AM/FM Radio and RDS receivers/transmitters
- Software Defines Radio receivers/transmitters

> +
> +Due to the diversity of devices, the subsystem provides several different
> +APIs:
> +
> +- Remote Controller API;
> +- HDMI CEC API;
> +- Video4Linux API;
> +- Media controller API;
> +- Video4Linux Request API (experimental);

I think this can be dropped since it is part of the Media controller API. It's
not a separate API as such.

> +- Digital TV API (also known as DVB API).
> 

Regards,

	Hans
