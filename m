Return-Path: <linux-media+bounces-31832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C92AAC079
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 11:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD9C17EDEC
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 09:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39C72701AD;
	Tue,  6 May 2025 09:53:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50834269B08;
	Tue,  6 May 2025 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525238; cv=none; b=pdlzFifmm9yXek5I24bfESQe760DbV2I2KV++hnvv3KDJYHjZHnWwbkk6/0q/l2mdQLbUr5kwfX5VfKYUNZT+O+petdbTV1zflpWYDZI1Ai8MGgb82m8As1UC0H1rNuN4do9n5rY0iYeoEYPjMit68HF2uurv0UKH/83ZzP1ZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525238; c=relaxed/simple;
	bh=LBead21n81oAN4XdCQOHgz/lI7j9Rp9T/2MAQdZxJgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ggzt5w6vQExHLuF7KGuQFvMIpqAzw8JKBzFWZbdA65vmhJ7NbyIpa7EeP12g8i4euM+BGZ43dn4jc6AZ0SO06nxdNw2Jmh7UzTQsRL/N1PEwRlr1mIL03luy8AFeXtdBGwNdcEsPSAj72oq7jYTbAPrz6pUINm1Y6fwkA/TiE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FF6C4CEE4;
	Tue,  6 May 2025 09:53:55 +0000 (UTC)
Message-ID: <de23db31-0cef-4689-9bdb-72639e34285c@xs4all.nl>
Date: Tue, 6 May 2025 11:53:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] media: platform: cros-ec: Add Dirks to the match
 table
Content-Language: en-US
To: Kells Ping <kells.ping@quanta.corp-partner.google.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org, Benson Leung <bleung@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org
References: <20250506164224.1.Ica91496a34ad5c3f9330c1a7992f10eea10e471d@changeid>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250506164224.1.Ica91496a34ad5c3f9330c1a7992f10eea10e471d@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kells,

On 5/6/25 10:43, Kells Ping wrote:
> The Google Dirks device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.

The v1 patch has already been merged here:

https://gitlab.freedesktop.org/linux-media/media-committers

Can you post a v3 with just the diff between v1 and v2?

Regards,

	Hans

> 
> ---
> 
> Changes in v2: update ports
> native driver cec is port 0.
> bitbang driver cec is port 1.
> 
> Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 12b73ea0f31d..81b4524c69f4 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -298,6 +298,7 @@ struct cec_dmi_match {
>  static const char *const port_b_conns[] = { "Port B", NULL };
>  static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
>  static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
> +static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
>  static const char *const port_d_conns[] = { "Port D", NULL };
>  
>  static const struct cec_dmi_match cec_dmi_match_table[] = {
> @@ -329,6 +330,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
>  	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
>  	/* Google Dita */
>  	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
> +	/* Google Dirks */
> +	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
>  };
>  
>  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,


