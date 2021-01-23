Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6699B3018B8
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 23:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbhAWWnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jan 2021 17:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAWWm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jan 2021 17:42:58 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB00C0613D6
        for <linux-media@vger.kernel.org>; Sat, 23 Jan 2021 14:42:18 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id ABD641B0011D;
        Sun, 24 Jan 2021 00:41:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1611441690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=O48eYmQkIbaVhWQ54ILkuviDi4sNtLv7LEWzgaDPCl8=;
        b=ripkro+49Y9HXF7VvB0hOu2gdvhGIjN6ePoXqceAQxX6mp0Pc7sze6mIyT1Vjs0iWNRYT5
        EMkm+mIjikrR8sQzxhqdQJ3MHlIDl4bqSJY4tZdPLWN94ADL3HeUII625cD8WF0SDhzXAx
        EWnRiKApcgKnMXydXAfCWrVyi4kVM1evPYI3+YdFoTTRdXx8VF78jgBynvwNlKYDLfbR33
        YHIWu6mIUQ+X92v5Gw61r96xNjL3mJo94SuZDGMwDkRFPl8O+55i9nx70SDIqb9FBJe+i0
        91jsUqwL1x2q2CwzD/5gdvf34do+8uZqFf92dnLllDpAIwMZCWrX8hK+Asifjg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A7033634C8C;
        Sun, 24 Jan 2021 00:39:58 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l3RZW-0004zT-A0; Sun, 24 Jan 2021 00:39:58 +0200
Date:   Sun, 24 Jan 2021 00:39:58 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 06/14] i2c/ov8865.c: fix error checks using wrong variable
Message-ID: <20210123223958.GB3@valkosipuli.retiisi.org.uk>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
 <20210120094306.784318-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120094306.784318-7-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1611441690; a=rsa-sha256;
        cv=none;
        b=SevThIuOU6jMHN3p9TkF+wbM3axsaJ6MxLt0xvx3prJMGQpbv9kJsB9M//5Ve4f5Q9Zz6C
        A/hJxrkjPGg+DepHRPvMBNYfUjbc/6xyJ2XLoXsHGsuYMvQp5qJJwplhN62TC5uhI7Q4xD
        Pl8gFuZ0/B/0LsH+aWbP99PIEbXNTAEcajUSTaeCJfV4WMniXJsNOSbSM+vmIVM0h2MWx9
        SwypvwrTnvUYNTGEqljtneii0ovr8R+wETL5r2wuZcY4ZEjZ+THyGQc4oFHc9RbnhV/cp3
        Ct2dlxvkyedG/LFcrUnqjhgKTJ7W2eAgWm/Z8+JC37YSRWw39WDrNKdl1gRYhg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1611441690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=O48eYmQkIbaVhWQ54ILkuviDi4sNtLv7LEWzgaDPCl8=;
        b=BCxJJfJ0/0vG5dRO+gkV9Qp0N5KZbJTbFmjJW3sEirnoTZvI6oDrZIGLb+3PzFHwXs5qlt
        9ZJpsRaFDvUbWYM6+fUpifIFlVTa0dP9DwRc2H2FbvCYqTodw9BnTGLpWbeq62xLDEBtgJ
        LLqPsYQ/fLcsvsP49nmhU3BrB1JGENBvfZ6LCr5W2m7nO3TaxKu/tciegSc/BUn7jUWjpu
        3Cglo1MckPSNj4JVjyiam7TB9xdkhErEG1ji0LgfGHhvK+G54YGcNpiv9DnatBkBRR4JWD
        Cjf152CPvTjDbyDUuf9GmXuETdydKR0klDk3nZPqhTNCUnkTR1mpJV2aLz1ihQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jan 20, 2021 at 10:42:58AM +0100, Hans Verkuil wrote:
> Fix two typos: dvdd -> dovdd and dvdd -> avdd
> 
> Both clearly copy-and-paste mistakes.
> 
> Fixes this smatch warning:
> 
> drivers/media/i2c/ov8865.c:2852 ov8865_probe() warn: passing zero to 'PTR_ERR'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/i2c/ov8865.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index fda5a55979aa..72ef300c0b67 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2839,9 +2839,9 @@ static int ov8865_probe(struct i2c_client *client)
>  
>  	/* DOVDD: digital I/O */
>  	sensor->dovdd = devm_regulator_get(dev, "dovdd");
> -	if (IS_ERR(sensor->dvdd)) {
> +	if (IS_ERR(sensor->dovdd)) {
>  		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
> -		ret = PTR_ERR(sensor->dvdd);
> +		ret = PTR_ERR(sensor->dovdd);
>  		goto error_endpoint;
>  	}
>  
> @@ -2849,7 +2849,7 @@ static int ov8865_probe(struct i2c_client *client)
>  	sensor->avdd = devm_regulator_get(dev, "avdd");
>  	if (IS_ERR(sensor->avdd)) {
>  		dev_err(dev, "cannot get AVDD (analog) regulator\n");
> -		ret = PTR_ERR(sensor->dvdd);
> +		ret = PTR_ERR(sensor->avdd);

This change is already in Julia's patch on which I've sent a pull request.

Could you omit it, leaving only the dovdd check to avoid a conflict?

>  		goto error_endpoint;
>  	}
>  

-- 
Regards,

Sakari Ailus
