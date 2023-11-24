Return-Path: <linux-media+bounces-998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A337F8626
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 23:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26AA2282B04
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 22:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8D93D976;
	Fri, 24 Nov 2023 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b="mpKF3jkv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A03C10F4
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 14:30:02 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b2fa4ec5eso16520235e9.2
        for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 14:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1700865001; x=1701469801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9aMoVAYZDthyr2anGCDJRxJF5mVykGeJEK+2TP+uDA=;
        b=mpKF3jkvLQkZD3AydPUFWQgxTtNJ5BpR+u5CWkZSHj66HKpXkh6NYDf8iI4KTZdHxw
         b+N/rdZcKumT0oDyCJlgLfzSsoqudC6zoVJv10aL4zkrumjviYZLlLWoLZpjfNLqzcQl
         yjIbOA4BOOanvOsw9BU7VF7bA3rNIAWsnEg1xqZqIqbMeeNM3ztwwk/bu5odN4Y4i65C
         ynsbgnk2FD9PDr+80W234Rinv1Ri7c4cKS0HcbF1nd90QuYUDZCVFM7CAOvlElCiMcnT
         fufl7nbPlLZOXq6t4ZrIbze0/j1QyRQ1ZFnka9IVKiH81A8MJnRqzfYXU1ZfjMSQ0cp5
         e/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700865001; x=1701469801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9aMoVAYZDthyr2anGCDJRxJF5mVykGeJEK+2TP+uDA=;
        b=A5u9di1lUZUl1iDj1/0GIBftl3NkIE41qKyinCPImsB+2qpjYEzJuh2xlTMmIDgd1r
         wpXRrlcKH2RlFeSa/MC6dk2SYuh0qX4dVFK5Ow2/emSaPWI8ar5SdD1jnLDCED5VZ1Dy
         7/y11TrUKyhphvQrSQ6VSef+ZlvWfbk2Qa6Bs6q8N2G0IOb8l2bA/ofNH8CAlNlQ179t
         RyMVYbHPA8u0yXG2lSm1PLIihawtDW5Vt9h4ddg2vtT57bNxktOdZyyS+Z4tQ+rE/qZH
         iHcNcdAt2fHxfmOOQtp44JFdfqxE2OoP//oJ3XHs2HdS4qZY8mmN+S328Jo7TsaXoCQB
         WW/g==
X-Gm-Message-State: AOJu0YzCl6PBgf+VWqW6PlLIurDLoGK7AjodxPX8BEgnt0kyqFEIIzKf
	OII3gNN4mKwJL5E5DIEEVkv1VpnYILoq9p1BSuFl2fjW
X-Google-Smtp-Source: AGHT+IEriUeR3Amtpl0U1j/IWdPGBWZcNP0dPbDNg/M3cJq/yy5X8cAy7YxhVmrIlfkD8JFMWZQvYg==
X-Received: by 2002:a7b:c857:0:b0:40b:35f2:3b42 with SMTP id c23-20020a7bc857000000b0040b35f23b42mr3286516wml.22.1700865000755;
        Fri, 24 Nov 2023 14:30:00 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d56c5000000b00332cbd59f8bsm5274213wrw.25.2023.11.24.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 14:30:00 -0800 (PST)
Date: Fri, 24 Nov 2023 22:29:58 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH V2] media: stk1160: Fixed high volume of stk1160_dbg
 messages
Message-ID: <ZWEj5sDUs83qn0pc@equinox>
References: <20231122161304.12434-1-ghanshyam1898@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122161304.12434-1-ghanshyam1898@gmail.com>

On Wed, Nov 22, 2023 at 09:43:04PM +0530, Ghanshyam Agrawal wrote:
> The function stk1160_dbg gets called too many times, which causes
> the output to get flooded with messages. Since stk1160_dbg uses
> printk, it is now replaced with dev_warn_ratelimited.
> 
> Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
> v2:
> Thanks for your suggestions Phillip. I have updated the TODO comment and 
> used dev_warn_ratelimited for inclusion of kernel warning.
> 
>  drivers/media/usb/stk1160/stk1160-video.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c

Hi Ghanshyam,

Thank you for the patch, but it is sadly incorrect.

You have created this V2 against a tree including the V1 version of your
patch. A V2 patch should apply cleanly against the source tree, with no
previous version first needing to be applied.

On another note, why are you using dev_warn_ratelimited here, and if
there's a good reason, why not use it for the other callsites in this
function? (Genuine question here, I've not studied the difference).

Please create a V3, many thanks.

Nacked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil

