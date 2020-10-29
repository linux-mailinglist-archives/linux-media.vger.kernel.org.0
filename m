Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B8F29F016
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 16:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgJ2PhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 11:37:01 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2274 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgJ2Pgp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 11:36:45 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9ae1970004>; Thu, 29 Oct 2020 08:36:55 -0700
Received: from [10.2.62.160] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 15:36:44 +0000
Subject: Re: Suggestion regarding x8 gang mode device tree changes
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <treding@nvidia.com>,
        <linux-media@vger.kernel.org>
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
 <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <59f91ac7-84fc-a9fd-e331-35adf4e5f5b9@nvidia.com>
Date:   Thu, 29 Oct 2020 08:36:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603985815; bh=pY4rt+caN0pumMUtBhuxn1trGtHJLfMc8fPpFaC+1qQ=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=MSxiv+CqDor22YzXQ7U4nOiFV7mlQej8yQTfgC7ir61ToiWmJLq7GV2Fedd42bc7O
         xXpsaNtEQU1pECed9xiIpjvzuuvGNzf9Oc5U2GGSjZHMSJx/ARb6YocKP6SUKySJSe
         VYRWyGGuyiGMm3eaK6HoieCl6jL5lGhWxg3Ls2zBpH9AJbCVY8sL33AzJSQgIc/Gr1
         JhCz0pdP3X8NqBPj7O7hjqlZChJqBWDAeDminKM8baqAvvKvI+HJFEvvmq0FDM/r2C
         PNBdTh0mU6IjT3VnSCme+1wICgn01QD3JM6YIVI+HncXrUwRmKv8GOClw1ezQO5IHF
         ToVz6g0bwwFzQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/29/20 7:50 AM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> On Wed, Oct 28, 2020 at 06:48:59PM -0700, Sowjanya Komatineni wrote:
>> Hi Sakari,
>>
>> Missed to add you to below patch series for HDMI2CSI bridge support
>>
>> https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-1-git-send-email-skomatineni@nvidia.com/
>>
>> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
>>
>> Would like to get your suggestion on x8 gang/combined ports capture
>> implementation.
> The majority of CSI-2 receiver devices support partitioning the lanes among
> different PHYs in various ways. They do support usually up to four lanes,
> but adding four more lanes is not a reason for making the API different.
>
> So instead, you should implement this as a single port that simply has 8
> lanes.
>
Thanks Sakari for your reply.

current v2 series treats as 8 lanes. You mean to not expose 2nd port in 
device tree as VI/CSI side takes care of 2nd port as combined to treat 
as 8 lane?

Thanks

Sowjanya

