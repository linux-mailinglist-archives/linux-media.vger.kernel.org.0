Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D683A28CC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhFJJ4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:56:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45481 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229770AbhFJJ4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:56:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id rHOJl6bJzhg8ZrHOMlDJM6; Thu, 10 Jun 2021 11:54:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623318867; bh=CG9sFw/fswsv37BjFN1Orhib2vYFwBd1nKGlGTkpNvA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EPyvsAj2jFPX5C7Jht7CvKX/2JUi0s2xbHwzJI0gc9aX1wpuRLIsP94cszTdBJE7m
         cUnDQntgNoGJL048zu4bEgJ5dTX4EY1qufd9B8MDytmxATRlK4fn+xmbQ92oUKLOdM
         NH/4d8Pyz6SoSc6yi4O1SI+iwQNX4CE1STg5SzpDt4cZCnbxHy0rX2othO+K8LB/EF
         mlXKX5zCGQhpg54T0hXRc6zd8SobUCS+3l0Plqbw9wpInraxQ40w3d/7CYQekEZHn+
         Wj5C29hnF+0iVXYJwKOyOto6keZqVm0R31DOJdri0OJCV6rUu5Re09fIsy0LHCZNjK
         Cr0A+2TnOe3yA==
Subject: Re: [PATCH v3 0/1] media: v4l2-subdev: add subdev-wide state struct
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <9545ec25-4fea-b7d6-b02c-5beb1242678b@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fe05d905-8b25-9768-94ca-ca85fff82dd9@xs4all.nl>
Date:   Thu, 10 Jun 2021 11:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9545ec25-4fea-b7d6-b02c-5beb1242678b@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF8vWH+QkMxlh0dtDA28Kv9DsKw7CQyPOksUfVoyfyo3e8zrkR3AhfbdF5IJtkyRR8qUyqe1AIsvTgO8ok3WOs/K264IudL1cv1o91lMePrkimKc1Cab
 wxXodB57/tSQcTTE0UCLK0lpeFn9SFHfVkTOmprS26r4TZrgYKlWQz3p9yApcz8f9f8F2Gn4r+OYsgbf6DywBlQzWmZOUZKyzUSdmAfs/lLg/C1PotxGYiyR
 36OgRX4TjhT8nE/vcKKXirzFMXHuRw+C40btJaSC+fQBLti3IbQcaohhbXSwiPsgPcP3swA3Q2e0P+5WPZQ1jXV13cuKT+V0jX0uiAnLAtWNpaveZPNnvSeC
 InfJMi2uK2ntV13pjo8zw1D3raRHTA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2021 11:51, Tomi Valkeinen wrote:
> Hi all,
> 
> On 09/06/2021 13:02, Tomi Valkeinen wrote:
>> Hi,
>>
>> v3 of the patch. I rebased on top of latest linux-media, and applied the
>> semantic patch. I've addressed Laurent's comment (fix kfree, kernel doc
>> fixes, return cleanup).
>>
>> v2 can be found from:
>>
>> https://lore.kernel.org/linux-media/20210527094244.617473-1-tomi.valkeinen@ideasonboard.com/
>>
> 
> I posted a few fixes to this as a continuation to the series (patches 
> 2/5 - 5/5) in an ad-hoc manner, to help reviewing and avoid sending the 
> half-a-megabyte patch.
> 
> All those can be squashed to the original patch, or I can send a proper 
> v4 after getting acks for the changes.

I can squash it to a single patch before making a PR.

I'm happy with this series (1-5). I'd like an Acked-by from Laurent and/or Sakari
as well, though.

Regards,

	Hans

> 
>   Tomi
> 

