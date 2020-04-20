Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0EF1B0B8B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729742AbgDTM4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:56:48 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43991 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728619AbgDTMos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:44:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QVn2j1Gon7xncQVn5jHMy6; Mon, 20 Apr 2020 14:44:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587386687; bh=6V/RHokHlkqZC2wGhrEgZqhKv5p6/QpIW01iSKeg7Ag=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GZVai+LeMdDkPW/+0g4y1+VN6DJOhSHdhDfoBl/4MVN1PIEWUII4nYcGpy8Gz++81
         LQkRSn2PG7IHOJWepdLHG8jhPAFLDYoinqgBshJoQT1s+VT/bM7tY0f1vmbUvkH4UR
         veH4xWqRTWZj3j9E5mK8lSVGlKEOdHloq2HKJHUVpyzxr2rK7ArsHWsc/lU/1PqZ4Z
         R7rawfbMB0l8Fq8wirmDJ7Plq5B4KwFpOvLS2DR+LlPjkd6An8pv4XpOwnz5nV3ugh
         /JbbEVSoTFuXJd6NRMCzUf5MYncieQ5rF6Y5p/6MjlxR1ijlcsDklIj+GouIr+T6jJ
         OB93MTKjtmv2A==
Subject: Re: How about a v4l-utils-1.20 release?
To:     Sean Young <sean@mess.org>, Gregor Jasny <gjasny@googlemail.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Rosen Penev <rosenp@gmail.com>,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
 <20200420121942.GA22485@gofer.mess.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f6a2df46-75f8-1481-3a1c-fcd53032c89f@xs4all.nl>
Date:   Mon, 20 Apr 2020 14:44:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200420121942.GA22485@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDfjThlSs7yJsLwVVCPWYGdzpy+yNFNvfuXj9ev2IuV3khcv7rAIEqsKTd7smDDOqNu/AB0TzD3TnpZyrqnNItQH0zqKxZvnBM3ty98Ohz4HMACevUQp
 yj0xTQ924hd0nFpMNhvpJ3OddmtGTIie//3BXxIfSi5plyWIzrKykJ7Ik6FVk7fxBtahn8rnRY195m7mmoBXozZeigqBsOnAGSnJiU/g7zVX8I6S920lGLQD
 LNvr+MEH1NpgeTBO06WlrtN9q08XTEUtI56EHHnQMXwXG6angO5iUduch5tWYRXu6rj7tTPsinA4lI09EV+ta8jl/TLLppELJxpdkp6M9LE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 14:19, Sean Young wrote:
> Hi Gregor,
> 
> On Mon, Apr 20, 2020 at 02:05:07PM +0200, Gregor Jasny wrote:
>> Hello,
>>
>> It's been a while since we released v4l-utils 1.18. How about a 1.20
>> release?
>>
>> Do you have anything that should go in before?
> 
> There is nothing from me. There are few patches on the list from Rosen Penev,
> cleaning up various stuff found with clang.

Merged this.

Regards,

	Hans

> 
> Otherwise I guess there is the meson build system, but I don't know how far
> out that is.
> 
> Thanks,
> 
> Sean
> 

