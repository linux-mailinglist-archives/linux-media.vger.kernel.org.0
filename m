Return-Path: <linux-media+bounces-44166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860FBCC7F2
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 12:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11BDC4EC699
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D1F2701D1;
	Fri, 10 Oct 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu9rtwj9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A024676A
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091388; cv=none; b=eiWwvNowGJpjw+Yhtv3PIEdcwSUAGXSFAjKwVNCIn62XJWUw/mwkoeAUbTEgeCZucSYFHWyzFX0Gj/eeIQcw844CjJGPK+2N1iY2dk2uzZcAq4lTAMWvVTXOUiZvp98L7NFeila8j1vuAER0OaenTqvhRO1KHt0UDkFo7ftKgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091388; c=relaxed/simple;
	bh=OAVZ7CtkTk7oahCjzvCIWGzl4/mVwUCR1IqNFho/WjQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MY8E6uD0tPwFy0LyXZYe708ZE+9WIu/upHQAel0Qpp27eLhw3P2R30KkvJSkhHKlRIKNh/0wGUHrX6V4rWHT1TvpREsgph0UkyxddhKkA47bokU+c0ciWzwi+esR5U881xtZAL5VMHEPBn3fvfNyirUXssgkZzVBAar9OcVi5i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu9rtwj9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1BDC4CEFE;
	Fri, 10 Oct 2025 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760091388;
	bh=OAVZ7CtkTk7oahCjzvCIWGzl4/mVwUCR1IqNFho/WjQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=hu9rtwj9gB8YPjzKGcJQbbaDqU7WwbC0/DToJABnzFswHRqZP+gVqAqE03j+28WqY
	 56QzrKypMZtYNF4pUuP13l+pmdPZKuTKnJRfvSxah2cD303yoGinqeCI26J8XGzU+g
	 khWJcaTwI5yBWcJ+uA71MlTJBqDu4zPNtlDwaD8Y4eWu1SSScKZgPEXPgpEiQTaGVY
	 MKtOqb1W1ykZfkvV6VSQNeL+o99TTJjK7pgRC3SMqaPelAMRVpBFCpRm7bo59Wi2Fy
	 DuHo+819Ae65Kv5XwF3sZkkVkwv6BhvfwU2rHwfg+5s6pwocfLJVCfF8QyJbpr3H7/
	 FIpBcCgzKcvyQ==
Message-ID: <5aceb74e-3629-4538-a8e3-8f97e00ac87b@kernel.org>
Date: Fri, 10 Oct 2025 12:16:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RFC PATCH 3/5] media: v4l2-event: add support for
 V4L2_EVENT_FL_MULTIPLE
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
References: <cover.1760090050.git.hverkuil+cisco@kernel.org>
 <77f928b426b65f96436c366ed75cd4a43bd877dc.1760090050.git.hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <77f928b426b65f96436c366ed75cd4a43bd877dc.1760090050.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2025 11:54, Hans Verkuil wrote:
> Set the V4L2_EVENT_FL_MULTIPLE flag if two events are squashed
> together.
> 
> Also use the new flags field of struct v4l2_event so it is
> copied to the events in the event list.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-event.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
> index 1bc1e2f8c3d7..2c0d1e66584c 100644
> --- a/drivers/media/v4l2-core/v4l2-event.c
> +++ b/drivers/media/v4l2-core/v4l2-event.c
> @@ -139,6 +139,7 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  			} else {
>  				oldest->event.u = ev->u;
>  			}
> +			oldest->event.flags |= ev->flags | V4L2_EVENT_FL_MULTIPLE;
>  			wake_up_all(&fh->wait);
>  			return;
>  		}
> @@ -154,6 +155,7 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  		 */
>  		second_oldest->event.sequence = oldest->event.sequence;
>  		second_oldest->ts = oldest->ts;
> +		second_oldest->flags |= oldest->flags | V4L2_EVENT_FL_MULTIPLE;

Oops, that should be:

second_oldest->event.flags |= oldest->event.flags | V4L2_EVENT_FL_MULTIPLE;

Regards,

	Hans

>  		list_del(&second_oldest->list);
>  		list_replace_init(&oldest->list, &second_oldest->list);
>  		sev->first = sev_pos(sev, 1);
> @@ -171,6 +173,7 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  	kev->event.id = ev->id;
>  	kev->ts = ts;
>  	kev->event.sequence = fh->sequence;
> +	kev->event.flags = ev->flags;
>  	sev->in_use++;
>  	list_add_tail(&kev->list, &fh->available);
>  


