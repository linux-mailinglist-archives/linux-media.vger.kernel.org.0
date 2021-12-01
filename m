Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEC84655DE
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 19:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243107AbhLAS5Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 13:57:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39428 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhLAS5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 13:57:15 -0500
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52766A15;
        Wed,  1 Dec 2021 19:53:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638384833;
        bh=HVxsBceLwl0lYO7/fRcFFlsp1qKSafZy4YeuIEbaStE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=i3sdRbK6pplNlc0sytrA60PQHlXm51h1q08PetoV+odzq7AssccwNQTYKim939lOq
         k+m+ytyQq5Q5fb2uCL7J0hzYXnhwTNWQAHrLPzUqV4iHyPEpUEQenH90yiNMHQPzyn
         QIo2g/+8KL83zr6917RNZaTNW4Moz/C7tgSbDqJw=
Subject: Re: [PATCH v1 1/4] v4l2-utils: update Linux headers for multiplexed
 streams
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
 <20211130141815.892354-2-tomi.valkeinen@ideasonboard.com>
 <Yae1zDMjDUhNbycF@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <2905eb5f-89b1-9543-3b37-cb542566f794@ideasonboard.com>
Date:   Wed, 1 Dec 2021 20:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yae1zDMjDUhNbycF@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/12/2021 19:50, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 30, 2021 at 04:18:12PM +0200, Tomi Valkeinen wrote:
>> Update the Linux kernel headers for multiplexed streams.
> 
> I suppose the patch is for testing only, and will be regenerated once
> the API is merged in the kernel, before merging it in v4l-utils. It
> should then use the sync-with-kernel.sh script to pull in all kernel
> header changes.

You're right. I should have mentioned that this series is not for merging.

  Tomi
