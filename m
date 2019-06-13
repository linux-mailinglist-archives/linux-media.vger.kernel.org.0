Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D21EB4444D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392550AbfFMQgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:36:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48700 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbfFMQfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 12:35:53 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0CFE52B;
        Thu, 13 Jun 2019 18:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560443751;
        bh=xYJTnR0BQQsX9pSkqK7GIQ6uoOB+X60qJ0Nav0xrwYE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KyS1UsvAm48Ahvvu+6wlakTthmDnIYVISXTkkNlPky7ERMbQ1PMQXh6v0ldpM28nm
         aIDWrWBjv/Pd6LtreDBJoFGhYFGnCv4BG852XXxKhNq8AXCGb4X4LpaxjbB8IYr2MB
         NGeOj4EUmKkSGfBqRLqdpqUCITWZ2pZe2FM1qqug=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/4] media: cxd2820r: don't check retval after our own
 assignemt
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
 <20190613155421.16408-2-wsa+renesas@sang-engineering.com>
 <550e0dbf-1776-000b-27ca-40e40e317da2@ideasonboard.com>
 <20190613161922.GA5015@kunai>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cbf928b6-33d6-d412-87dd-05f1fb5f1b6c@ideasonboard.com>
Date:   Thu, 13 Jun 2019 17:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613161922.GA5015@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wolfram,

On 13/06/2019 17:19, Wolfram Sang wrote:
> 
>> In the title/subject:
>>
>> media: cxd2820r: don't check retval after our own assignemt
>>
>> s/assignemt/assignment/
> 
> Eeeks, in deed :( Shall I resend? Sorry for the noise.
> 

Not necessary for me, so I guess that's up to Mauro/Hans.
Not sure who will pick these up and apply them.
--
Kieran
