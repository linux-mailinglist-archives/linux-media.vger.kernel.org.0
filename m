Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFE423A11E
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 10:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHCIhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 04:37:45 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45863 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725806AbgHCIhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 04:37:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2VyXkmYQ8uuXO2VyYkbWkn; Mon, 03 Aug 2020 10:37:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596443863; bh=8CIU3hUg43JkAgObuiJfpcFHTu/6L78gs0gbCmmlCCY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XHGO+GSr/0gZ4R/U+tP7azNAFyX+Ix7dSUeTSOZoVrb/uhVBG4BRCwghGdJE3NGW7
         Mji6Q7JsFN7w28Olk/lTtDDyhWDnFGN62SAe7NKFUQkQe1CAVAB+WqyhpXGy74XSOM
         uJJicvlYGDiX8jman5rbU/1bfyWun/P/Ab3GhSs/SCqT5bEwohqkpNSSZlr9THl0eC
         EFxsdSHgwjAkhErnPGelzM7nguQDVU/2rl///o8fUEElzII91Iqsc6XJLsf7mTvhTw
         d+z5AB0aSDH3L5lcKScekigpEJO8IKrhQmSrpze2F5LYnCNbsOnuWLHKdUaGmLFH12
         l3uud7oLQOKJQ==
Subject: Re: [PATCH] imx219: selection compliance fixes
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        libcamera-devel@lists.libcamera.org
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
 <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <de5d3ddd-2792-f59d-87eb-7dacd4952aa2@xs4all.nl>
Date:   Mon, 3 Aug 2020 10:37:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIRbLXgrqmNrW7UxbbFzC2SliVn72irdyapVhhFTIQOlDCwT3ahO60eQKo3U4scSgTjxYtVXyE6wQJDGiC9EBbIJuvyXd2AHJzNVwwmuPqHGIWBvX+7R
 oi6FOS3RYAIYvMG02ldhvfbbupLr1Xs/Oe/Amvnu+uFyNuH6ryI/P40FbMdNlZqU20PvMcTz5MQ8NC8bs+NG2YeIfel4XRtqLAhriUhcs8Bu8hv7WISHfUzw
 SJao/MFWbC7llYszIFiVqvOoW/5IJltf9CdIK4HwGa5R3xRjAOFR2fPgpsXoY+IQsEtcpp1QujN6WacQ/6E5f4Lb6tdxGBoaTfgDYfKOJcjjoIU9w5PiQF1f
 wRJaXRfGt0U0TRrKCo44FOZjZjngmMGy1Fy3vzm0h2037P1NCDSTeHyEbd/Cm03PnJaHSP83KrIsE/bSd/jiEK/nyHnDuh4kZFCesGgT0wOtmlaKGdaNZDct
 Nu1EpdmQG26a1uMUn925OIPqWqRoORhIsTW9U+yl8+rHC8xvi8cXzWszOU/g/VdWjAhaIjvC/ZYt5uTPha82C5pRDLJAuAm4g9LkDAVv3qrZD55CzsJm+Vws
 fLBFmCYAnYp3c0pUbCnu5m9a
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/08/2020 13:19, Jacopo Mondi wrote:
> Hans: would you like to go ahead with this patch, or should I take
> over and change the libcamera part that parses these properties in one
> go ?

Feel free to take it over!

Regards,

	Hans

> 
> Thanks
>   j
> 
>>  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
>>  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
>>  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
>> --
>> 2.27.0
>>

