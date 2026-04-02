Return-Path: <linux-media+bounces-57954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GzNDy1ozmlRngYAu9opvQ
	(envelope-from <linux-media+bounces-57954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:59:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D6389547
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B798530EF61C
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89D41A6812;
	Thu,  2 Apr 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ry7I9d8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3533C344F
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134258; cv=none; b=A1qIZnNDj+xjGyyA6zSPHRgzi95Xx1HE0MM4Z0OXYepBvx846gINOdN/HB7UDT9TFo/KMcg9dGcpg6MAPvOnkzMhJAu+QX12qmczKwFoGIpX2tKXTiWnPATpR9L7BSuArq0hLZypbfho+5ApM+CvuVcsyZgqTAOHhn/T+6bDw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134258; c=relaxed/simple;
	bh=LVzd5c1yaEflvoMwJBZ9ORCT/m+zQEYn9cRCtoBlebQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvRjP/l/WuaGiMgy1cya+SQbhlcCeIJ80TkOj2vErNnG3IpwEaESJDMJBEA6klvlznuSnjlGFkBsmh67cvX3MhaG9N7kl8p6P6oC7Iug+lqkL+W3in3EqxZnelHy0k3wNwVUmcEJ4hf29CZe/JqX2HgvGOP8ippabyhCz704iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ry7I9d8Q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so6594045e9.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134251; x=1775739051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nG3vW7Z/w/H1UAzXVzRtl5F/iCy7NCe80W3XYhEGbDc=;
        b=ry7I9d8Q26SP+/7Nb9GPNgDajkPnG8kAAX0b/yk4iKOGD3rL0hJZ2dKi6GbAQfII0P
         /Ax9pD6H/3g3DfSr3i5yJWiFlM8NghXfIUPUywBHbte+rDLQ+eEI8f6JWs9ul0AjH+84
         4clnq7nEyGmR9HrVkIVwO950tHYjNJp5Xamz8H+VhJa6CC0c19weVD3mSx0yGd5Zu4T2
         iTW0qRCT0T1ktI4GusoXuK9QhviflhTF/BDRZ9UqOGfmtLiFYQJfaZEX/DrBcwBYTgE6
         zQQI4tEWRU22ybic4NsoJ4TmvBf9pL3TnJbgwjzMGRMcnDBHWt31pxXsIFUU5QTWVqi3
         /ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134251; x=1775739051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG3vW7Z/w/H1UAzXVzRtl5F/iCy7NCe80W3XYhEGbDc=;
        b=MwqdFUVG6zpIiowkR0Ke2BVMRdDGekyujtqb4pvgyLPMHuXm0orbut004vLF4UbxXr
         6HBu+KzXnJ+luH4eXd9AJXnrmltI1BYTLrWg9CtsBdQFeeubQQXWoNew3O66TE1Sxmd9
         E9Jfc81lGOnvhmSEn6bwDSNGNRV70orI1w9gFWLXYqFJafjiiCvOFLWFr5uyMt0qt29e
         HyU6fQsUtRMstJkAER04GgamGZlLPNVt1KatvTY9+iHSwwDJQvjOjA2jBkfWcx6EADS+
         iaYGXM5M4x1vljt2ENJ9N+93s1IYdBRRUPKWLFtDWXYs70E0CI/2m1ztc4K5+yZxWmuu
         52jA==
X-Forwarded-Encrypted: i=1; AJvYcCWgyb5DuJj54CkuXUuDmqKulv9c5vk8s4Xg1cvyaR4iRR4AFO+3nPa8BleizYu5TDQKJdjoVWIHVqlDfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXe8yZ11zoUzWiyPx74ytqLLNmkfYk+FLZqIjif+lVIZEBjgq0
	uPi5+GnboT8DYUWqCjnPVtkBCTnQpCxjKEA2HV2EHQqGjZqQYFqeOdVas5sPCA==
X-Gm-Gg: ATEYQzxosC7qSclP6ctZKJPTdz6ThrkmHBEJha4NG+TZcjtA1vtvzJdUSJ7Xc1/JFke
	iqC23N0lqzIodawoQjv9KvQQQwr3ZkcLP7PdNWBae6jMVYtxcyHpUs+FDzESB/vVgHSogyBvIdm
	WeBohzTTEDLVhgJLkfOKNGqPlWNgWF7OpVi0r4qX3hZZFh5LQ1vwRxA0kmdp5GSQIr9wRV2jtSk
	VVirBFlGqNUgfXhQ64xF2fZLlf0c6iJ9o4ImiE9mpbZd658cOZDfnrhDDZaYodctMq0yaL5h81k
	tWWhKVCx+1qk4Zi8BcSdcDGbit9AOiGV33k7/JOCZy1e9RUXie+jL7ZIwiOUz+8tAkIoxzWeuS0
	ybr3POCppIA4MIDwYs6ZOf0LMyC7Sa3ScWHIqx/rwMsgmo5MM/68dBDkVnxq4F49cUnFVN2hja6
	2pmtH1LnUcxx7eDzc2ml0=
X-Received: by 2002:a05:600c:310d:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-48883599311mr124397225e9.25.1775134251036;
        Thu, 02 Apr 2026 05:50:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm179643375e9.13.2026.04.02.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:50:50 -0700 (PDT)
Date: Thu, 2 Apr 2026 15:50:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: media: av7110: coding style fixes: too many
 tabs
Message-ID: <ac5mJodg9Y4InQwr@stanley.mountain>
References: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57954-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url,stanley.mountain:mid]
X-Rspamd-Queue-Id: 900D6389547
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 12:47:42AM +0530, Sudarshan Srinivasan wrote:
> Fix warning reported by checkpatch.pl
> "WARNING: Too many leading tabs - consider code refactoring"
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
> v4:
>   - Added the missing check for  "feed->ts_type"
>   - Removed initialization of 'ret'
>   - handle_ts_memory_fe() accepts only "feed", "demux" and "av7110" extracted thereafter
>   - demux->playing assigned to int, instead of bool to maintain original style

LGTM.  Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


