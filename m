Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5D739DAD6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 13:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhFGLNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 07:13:53 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59245 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230131AbhFGLNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 07:13:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qDAglhjHdhqltqDAklKWH2; Mon, 07 Jun 2021 13:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623064320; bh=KpZdlWL2P8yjtAatyx6/oPtWRFHD5h6IXihvSIBk2E8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wSxlRzufI9XnCtU+1t7KJTAhAY6GX3IpEoLzXYMtDazhrTlSPBIfiCYKOhPY4YRJb
         GxsEn9EC1p7wHWxc06kJ1uStv3bk3gir4Jd6VqDicfBvnN3HzIdl2IvIDxtcrHVgD2
         w7Jc1sZIlU1WjfodNaqmZi6/4HeQT6qiT/ZKuAaUmOQQVJ0/c8KzGfMp+CmzU6saYN
         gzaZeXMvWXkA+C5BeQg14Ktg7NmtQuGoPWtD+7Za9nQ7coD/25nxL594zsB59TsMTq
         GHfTk4dJnnO4bf6AMpR6SNgqV6iclRM0k/CX9UOnK+qeWT2sI/6HNvuytGxo5vfZXB
         L5Ykt+BOAMXOA==
Subject: Re: [PATCH] TDA1997x: enable EDID support
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
References: <m3sg1uq6xu.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl>
Date:   Mon, 7 Jun 2021 13:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <m3sg1uq6xu.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfG0ne/tuq0sNWpINBRto2ZAp9WAZhKCY12jpuVboaBieq9x23RiaRtBEUiaoJN7tJXm4Vn3/cKubZQxb72lw4geS1t+L0M9hkhWhRHWww7y5XKVAPPRr
 Ob4yj600Vpkt0wUzUhXlS9R8kOTLkZp7+mnRnAhj9qkKEQRAAVVcO3DZNthanj1bICwORmTfNWgFh1hdXiWk/nJlWdiuN1u6lWltQc9kJs3LC16hD73mKfhV
 bAStqGaw6Lqj0KfgBlHgnFdFk3ZHpaaqEoZG+4SyjVFi+aCLP1AYq+/Sq9XImutcuN8ytTeOrjB2jRUViLug0RZmo5Jtmc9sHGnMoUolsLc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On 07/06/2021 12:56, Krzysztof Hałasa wrote:
> Without this patch, the TDA19971 chip's EDID is inactive.

Was this wrong from the very beginning? How can this ever have been tested
without an EDID?

If it broke in a later patch, then please add a Fixes tag.

Regards,

	Hans

> 
> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
> 
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -2233,6 +2233,7 @@ static int tda1997x_core_init(struct v4l2_subdev *sd)
>  	/* get initial HDMI status */
>  	state->hdmi_status = io_read(sd, REG_HDMI_FLAGS);
>  
> +	io_write(sd, REG_EDID_ENABLE, EDID_ENABLE_A_EN | EDID_ENABLE_B_EN);
>  	return 0;
>  }
>  
> 

