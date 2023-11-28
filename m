Return-Path: <linux-media+bounces-1224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D237FB736
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51CD3B21F1F
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EA74E613;
	Tue, 28 Nov 2023 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="SzR9Fbng"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF991BB
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:24:41 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SfdqV0kv4z49Q0d;
	Tue, 28 Nov 2023 12:24:35 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1701167078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glT4xRKxbtiB77wTyn6TUTVJgSDpIPJElFi/h93EHSw=;
	b=SzR9FbngoBXq6tUut+70qJTXUvSASrTA4EP369I7eqyGBoYquGDGN/JosgnAvc5OCPcv6F
	xzrj6jYRidxZ/niNS1+gR4AtARVfuQAGMz2+ZzHKmnBH3hghn4DBRJ7CI9Zo/DJp5+E9eG
	fZiC4gs+AQOxaIfc+0bG6Hw71atGTVWqHPhFuik/202l14gZ60ynx+qIAFXBEoISp/hOUB
	95WJErgPIncex9U0crDujZ2UETVJsbArBe/Woae15WFCMqk6Z61LHCyXzZUk9erf9knpO+
	/2sjbJzOe1yNCAb0sDIYaTwYCvCHW5P3/pk4pKcKQNATpGWk6KorCQmeoQg04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1701167078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glT4xRKxbtiB77wTyn6TUTVJgSDpIPJElFi/h93EHSw=;
	b=I6CbVijxxo3u3DOvBjiBvb43UyP7bwy7PTrBijqDf1asKjlvyOOu+MT590lTEXWxHk8AiJ
	QFLAoYtW8w15ze4WSd+Uhr8bNcvDp0ImKu/aVsODRq7Ak6jnmcJte3T+HXR65JO2GJ34pZ
	XO9vMwxyzTzyJu7WY96tn1tzGSWu3BY7tY1jWJpA4LFFXt2L0t04fEl9DQ3C5SweikOoSw
	rkEE3aJc1VVddYUNfOyjuptJyvmx0Gjkz7sdAju7PkSllWtJDZe6Xw88arU7VJpk6iPnz2
	qzqq1+TKgpHDYI7qjkYG2OW+615FP8mDYyS6jAFLLBEexIWao3fxZsGitwrmpA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1701167078; a=rsa-sha256;
	cv=none;
	b=h61gz2KcuiQNk6Pdj8D12cbA/Qy8/iqfcsF4ocKQp57DrU84QjyvkucYAE5WrCC3ZS3B0X
	538+hJVi735D8Zzo+v9nvMBLXQe4cTRBz+49AsWbXWUAHsJjZULBHpR1t3tU670BKXIDkL
	BKzsb/gkCs0UcyzNNaEgzxYJE+GIQtpdQNsBkzIdcBxvGetRSzn3Efv2eox7T4ziTD9CxS
	JVpNzRsLTiaN4bo8RL+l06DwVytcpcQtV4EcAw9u/jyxr+iiJSKCjP/zxrdDCpRW6yCZya
	bZtiqboblr3OCRrB97CsM1AcRrTdGI5v4skHoQD8ixEufNTh3brLGU2cC9OpMg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CDB06634C93;
	Tue, 28 Nov 2023 12:24:34 +0200 (EET)
Date: Tue, 28 Nov 2023 10:24:34 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: i2c: thp7312: Fix missing unlock in return path
Message-ID: <ZWW_4u6NzY2xAxCM@valkosipuli.retiisi.eu>
References: <20231128102222.9795-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128102222.9795-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Tue, Nov 28, 2023 at 12:22:22PM +0200, Laurent Pinchart wrote:
> One of the return paths in the thp7312_fw_write() function failed to
> release a lock. Fix it.
> 
> Fixes: 29adc7a89b52 ("media: i2c: Add driver for THine THP7312")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Sakari, this patch fixes a bug in your master branch scheduled for v6.8.
> Feel free to apply it on top or squash it with the commit that
> introduced the bug based on what is the most convenient for you.
> ---
>  drivers/media/i2c/thp7312.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 04b78c1f8090..3d46e428e0ac 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -1805,12 +1805,15 @@ static enum fw_upload_err thp7312_fw_write(struct fw_upload *fw_upload,
>  	struct device *dev = thp7312->dev;
>  	u16 header_size = size - THP7312_FW_RAM_SIZE;
>  	enum fw_upload_err ret;
> +	bool cancel;
>  
>  	mutex_lock(&thp7312->fw_lock);
> -	if (thp7312->fw_cancel)
> -		return FW_UPLOAD_ERR_CANCELED;
> +	cancel = thp7312->fw_cancel;
>  	mutex_unlock(&thp7312->fw_lock);
>  
> +	if (cancel)
> +		return FW_UPLOAD_ERR_CANCELED;
> +
>  	ret = thp7312_flash_erase(thp7312);
>  	if (ret != FW_UPLOAD_ERR_NONE)
>  		return ret;
> 

Thanks for the patch. I'm effectively forced to rebase the base and as I
haven't sent a PR, I'll just squash this.

-- 
Regards,

Sakari Ailus

