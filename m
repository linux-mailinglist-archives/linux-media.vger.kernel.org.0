Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA671B08C4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDTMHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:07:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43761 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbgDTMHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:07:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QVDIj14KP7xncQVDLjHFS9; Mon, 20 Apr 2020 14:07:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587384472; bh=EFYx/1TlyWQKnItV6pyyrJEj+k0z8gNP3lAgemdYbG0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=J0FJx25R4IQR5gNppyVkLHZbziBUAakCSSfL/09Nxa5NSNaK1n3J4Z9pc4ImXAenA
         1JZSaHmRXIdJcx8WkOiciID7r7p+IDo9hNKalXwKUmTatcnaSiiL30USvgBvxXF9Sd
         zhc54ag2ax/LB5GPPA+nMHQJyE8iPoCAu8Mj5PmucHENvHZcWT4r86zX5TawYHZ55j
         Y1UhIf2GSxXW5rZ0WqUuQYI7xd9sCq3pVPvANAtHWAwMV0iM2VYzXjkhQT0ig84tUH
         tGRQiS5FBy9NiNKnUtgsvvkHVd7RAd82yU72dIsworYVeqFcusVOvWRTJR/ZC1uk87
         9u/lD/P7unZIA==
Subject: Re: How about a v4l-utils-1.20 release?
To:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <907da6cb-3e74-9ced-acd4-2b6c23d0006d@xs4all.nl>
Date:   Mon, 20 Apr 2020 14:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCaZBdA0Nr+I05Huxx67Ec3+PddZ+C21leUAWtn/1EhieDMTkOVC98V2pLtGiZ0R5RfItT2mP4CuvfsT73cdtfQP3X3iuJIMyxyfUNP429xqBGMXzwnN
 nPrV8206DwFlYY13kKQQQ46lGrWnmpEyPSURaRtPjX+9A2IwIASuC3VuWUx+dJzqRNHS+6StKAnslNzvkUx0Wz6nOBPtiZ5pmPh+TPLf4f4hk3I8wVZVvmx9
 ++a/naoP/mcsYI9jxuJw6RWrkzPubedyyuLnKF6tdA4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 14:05, Gregor Jasny wrote:
> Hello,
> 
> It's been a while since we released v4l-utils 1.18. How about a 1.20 
> release?
> 
> Do you have anything that should go in before?
> 
> Thanks,
> Greor
> 

Nothing pending from my side. Releasing a new version is a good idea.

Regards,

	Hans
