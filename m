Return-Path: <linux-media+bounces-2043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CE80B25B
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 07:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F30D1F21226
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 06:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05151C03;
	Sat,  9 Dec 2023 06:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Af3rhEsT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097A610D2
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 22:27:47 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33339d843b9so2994173f8f.0
        for <linux-media@vger.kernel.org>; Fri, 08 Dec 2023 22:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702103265; x=1702708065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d2nZlR1cXieQ7aMHpSA2LHgWMUvUbq6OLThBUaEbD3w=;
        b=Af3rhEsTGM4YqdHk58MKmR7MxO16UQxoQq/w3HmRRJgg1Nu3vXLEvRnz2ozvPKToIc
         nYgNMt4CAyzG6EJ8YWO+EHkp0kyPa2WL3THH+IIemcyW7HuycCYp1n3Qrh34U6JfDXhH
         ydrYQuMELWu13mdowNZSpT3ny2T+zayAJHvM4vjDiqKZoCQJiEvJVXjjnpAuwhmzF0UG
         upDoDDlH4yv7NpZE0ruCPjWV+KrPmt2b7vJxlJeutb1PQM/DQLRoq/EEs9qEKiS3a1NX
         6UfdMTIWaUfi/6Ip8ceys31dBy5Ayv1pTDZI2JiLYkjM5Ihr8kltwUQndczCtw2NqcNI
         whrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702103265; x=1702708065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2nZlR1cXieQ7aMHpSA2LHgWMUvUbq6OLThBUaEbD3w=;
        b=DNLdss5sYuXAyfnWNgVCuvV1i8ZCV/u627Rybog7RkinXyuAX4IJkvWPWERsg/DCXV
         IKbF4IhmzMmZ/fbg38in0mnc5Td+eT4AeiO81Vnz00J8A/WHJl+nkuIBWgjKnsfgJ6ql
         dB7AofAJov7JOBy7b4pFKjCdY39rFrp1yzz0ZANI+eBWMlJz/R6Xq5/fPMdnC3Zgr8dC
         6iYL7FWtiDVysTsLZtEKZ+asKNeGKpxR0W+KawfKetEICDM84TF8rOoo6g4kIaa4+E84
         Sl1m3V0ggFzplP1FQuQpiLP+hA4BKWmksVARbRvnrNXBHP3bemAmysILj/wAZhiWzlOX
         e8tg==
X-Gm-Message-State: AOJu0YwGYIPa62P7wbjJNH0U0VxOELIjnUKP39Za1X/VhMN3C1fkp969
	Qg1WLd8x+GDt7v0K/WJsLA/Ef1e8C78J2/BCwDU=
X-Google-Smtp-Source: AGHT+IGZBpmJz88ZXkhtaoFYGNwrk348/06KJfaFJkwN4nmZxozymCnv76mn/q9bMlnrfz2Wv2lYXA==
X-Received: by 2002:a05:6000:110a:b0:333:5258:68ef with SMTP id z10-20020a056000110a00b00333525868efmr654738wrw.68.1702103265445;
        Fri, 08 Dec 2023 22:27:45 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m11-20020adfe94b000000b00333504001acsm3456113wrn.15.2023.12.08.22.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:27:45 -0800 (PST)
Date: Sat, 9 Dec 2023 09:27:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH v3 3/4] staging: vc04_services: Drop vchiq_log_trace() in
 favour of dev_dbg
Message-ID: <1883402c-edad-48b7-9081-32ec3538667b@suswa.mountain>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
 <20231205084157.73819-4-umang.jain@ideasonboard.com>
 <46e42bbf-e99b-4e61-a207-35e150fe4fd2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e42bbf-e99b-4e61-a207-35e150fe4fd2@gmx.net>

On Fri, Dec 08, 2023 at 01:08:04PM +0100, Stefan Wahren wrote:
> > @@ -1425,7 +1416,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >   	}
> > 
> >   out:
> > -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
> > +	dev_dbg(state->dev, "suspend: exit %d\n", ret);
> In case we want to keep this kind of debug messages, i prefer to have a
> common format:
> 
> returning %d vs exit %d

Someone was trying to make ftrace track return values...  Whatever
happened with that work?

regards,
dan carpenter


