Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC1A17CD77
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 11:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgCGKKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 05:10:03 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:59599 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbgCGKKD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 05:10:03 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AWPAjxCKE9Im2AWPBjJ8mQ; Sat, 07 Mar 2020 11:10:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583575801; bh=iLdG1zGHr8ZPumvTp91mbriwRK+vPXO3UWnn5kFZuys=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Kdv0eM283koFQIHExUUZF59WO+O7vvOdkIiema02AJR2MSIRTwf7oBCcSu0nPvatE
         ggjLQVgUBgdNe9X9U0qmNbR948yCa79OD1MXRt05ByrJMJVOpIHE0HpdnmtF13wp+2
         tId9swJtZsJBsR2rIszdtrvPfczhNdqt7Xy+oEDTDG+D1XGW5TfMaoVG9miny07FAO
         A/BD6/8VKygldFbeo4M7Kj5bAqqLyx/G6TET3L42JbpL12ATaLsQFApl7Xrgi+b/Ng
         4GlkM9zX6T+v0i+xAcp4E6Zcd7i/+ie3stCo4dUaxJVENuTJC2vz06V8grzDjZVMqq
         ttavI9zOVxzCQ==
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
Date:   Sat, 7 Mar 2020 11:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307094634.GB29464@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFDoeIqcb85xWsHf2P/nZpSOVl7gqSHVZsTEyh/Wolvg/WR75tVIE95xRJy0WLO6yzn7KMHsckvljhO3Ikm5H0D7D9FSuBsCP/LcBXPOYigGGTNV2cQy
 Ff3hr7yjjoFjgLxjHjgmbFoV3jlc4TQK26DVdLHxEH+RsFa65KQeltSkh8jzt2FcPtQ4tG4tTAlR0XnXgTxRMuYW01LxSTE7c7R4qYRCOO3W+EtkxXTmD9IB
 ezWI9p3JYtu11vFummieLHxR4VPD1O3N5BDGBIP5gtkQc2ZBJ9ed9D9P7TCD4X4FI93VZOGLiZr0jMM5nx6HVjCrek9gq1fys63S2ZJICgfuMPVA1BTdtOJj
 jAd1KOGpdzHzJ1DqX065iv8EucjpUi9CSPSb4nAs3CbJ18x+oWYUula1m7nZ4VWqj+VmmfBIhAYvp0nj5M8qO0Ns70m47LFBmssIya4B0yyM24qVvnvXSYNR
 Yf5fgIp/7ZC6QUlO7zSozIRFncci/w7mXyGgCkwXbsg3OSZR7mX8NiOSYLgROVTOzGjSqCIqkJnAHghfl9VEnP5s4jwlJAFeOmgq7VrZchiqfsR8cWDhf6kA
 EW/n6uXIynyLth0gcDUXzLEY8Fs/1VsbTv1AYaMk48Thzg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2020 10:46, Sergey Senozhatsky wrote:
> On (20/03/06 14:57), Hans Verkuil wrote:
> [..]
>>>   * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
>>>   *		driver can set this to a mutex to let the v4l2 core serialize
>>>   *		the queuing ioctls. If the driver wants to handle locking
>>> @@ -564,6 +573,7 @@ struct vb2_queue {
>>>  	unsigned			requires_requests:1;
>>>  	unsigned			uses_qbuf:1;
>>>  	unsigned			uses_requests:1;
>>> +	unsigned			allow_cache_hints:1;
> 
> Shall I use "unsigned int" here instead of "unsigned"?

The vb2_queue bitfields are the only places in that header were 'unsigned' is
used. I think that that should be fixed in a separate patch. It's nice to have
it consistent.

Put that patch in the beginning of the series, that way I can pick it up in the
next pull request.

Regards,

	Hans

> 
> 	-ss
> 

