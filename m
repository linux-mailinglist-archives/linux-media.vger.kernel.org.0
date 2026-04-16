Return-Path: <linux-media+bounces-58946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DhlFBkq4WkfqAAAu9opvQ
	(envelope-from <linux-media+bounces-58946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 20:27:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42198413BC7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 20:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DB57301C599
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9AF336886;
	Thu, 16 Apr 2026 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn8WVxi+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483ED301471
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776364046; cv=pass; b=igxOe95CSYRThUq9HD8aUz74l/qIoRcATUpQhS6+8oCAAH6VFkTXqPBDsV3rl4OFBrmnQj6hG71cezb97Ca6JxljtBCQ0rkJJQmA4xBIiq8kF+3e0RBX1uC66tGXUIfk2+N9W8lD8AUl9lutwsklKdzIU/V8Z2aT7C5l1EZf92Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776364046; c=relaxed/simple;
	bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig0ERt6YxvUZ9CEBWrv6Xa4m199k/iGFHMQVzFjZ9knGaB8fuNYXmbtPGpkTmLDz7zQeL+9M+IlVxVlpjD6CEwuNziGeFCrU9gv6dorA32wNvfAQgzL+q6BMo4kKm5LEmCC7P71LWoifuTr4OgB/ErB1gsJKgjZrGnFm5YSjG7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn8WVxi+; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6714f678bdaso8749239a12.3
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 11:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776364044; cv=none;
        d=google.com; s=arc-20240605;
        b=O+R1UsAy+UskJ/9eY6rtb6T+Fobd3wyOCFw8/de+131ISxdh1O0NX9rxvQFZwb8pGP
         iBmpXMeja5nE6O3CH4g4abR1YPKiJN8HtD18NokvRdmJ3R19vBb4o8P7u+//UxmQ9XJ4
         J6nfT2cRgQEYaMErxETSgFDEPKEnn+40gSMCD7tz86W/KwALAzq9DJrZGsGA6XWRqsIx
         q7hPBMUTS1nYIUU8YfG4Z+Ooh+I7lJqcqGVEHlEEf93Wi+CNXCP7HWOktON6Bwrm/+XI
         gmB/h+rfff7GvZbakix4pBcYsrs+XDr1TA0L7pkLKFs0DLMxyxqCX1zDQSZBHJciyeQt
         pEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
        fh=QZ/SjCuaGuBCanoLzVutwru/JOVoEly1nyTqOGP3S3g=;
        b=AfgWXiBlMYuGsv4F9aMXlrLjFdkGTIPPylaIZjhjIjdvSkBxBC0jASJ9tjDCjsXw8o
         LbN0pdoi9JSYWO6iQnC9qe6cuTESuS7DFN3m/onQhSSZG4pnGslHK6gGhaJHx9c1rKBx
         P9lNarIFYH65+WW+ehTJpX//pU1Fs8Dusgdf9ZUj7ziCklprvYoMtxeMAFZfLGL4GKA0
         AZGC3/uVF3jO4cTJoSXqTJNYqId/zF+NeBUUNc5RQ3ULETl87UuG47650GUJ+tne4ck2
         NvyVFe77J8ESV/YWu+EgfJkOY4ErL79OlVNJ9fHDxa+Nd+lEjmfRqnswfJKcYipWZict
         Znow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776364043; x=1776968843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
        b=Xn8WVxi+oF6W7MBomhSK8gNgiVbCNaashfknoA9gfE5iaOvGVJptsP+LEj69WNw9Il
         JcouaQX5QayN/hNsSDzOkMnRdv1b5rZemHjNqJ4wKswidvyGDecgXXlVak3lX6+Kgojw
         Xqe4t3lKXnRtmGtCh+o0VQllWv6sqT5Ey8cfjYzgach/sEGHMZJ48wWRofhHN9CbKu7m
         1vMQDUXokxELNh2LmHrTCdIdOB7GUk09nn/v2Gilm7NuHUHFDEP5Lc4rZd4rFC8VprTX
         FMVmdP/juf6UE2Olx73D7OwTnAxseWt/d3tLiLUyNiQlpVLZ3LyPMwMjYPkZzFfvibsK
         YkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776364043; x=1776968843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
        b=QMKbnucU9t0+X/wjiBog0ipvvRcZ8Infauxfpr3CZ4sWsqJi7w5gn9bjcihEw8HYsa
         XxT6NtwvXHUcnOYQuwFYHO3l6kZD3EkekUxr5bZGuAYw9iJF7V+WO5Rc1fWveat4mCqd
         JWgilYUEFNutWxKvgALsy3N+feLrudwxEBNJw2WEwZB19baXLpCHcgv+RbbELCRVSOXt
         CP8mVjwMRPwIAkgXFzAnkYxcJMdP2Pfzfv5nuB637CFF9hqkdsGtCZpIJW9ExPmWs2+a
         TA+F/7ygdQ7yHZ9yDDvRTljoziIFQFLFC55CDIms148uiKOqCSzt8DcqY/UrBNOs9IpJ
         mXgg==
X-Forwarded-Encrypted: i=1; AFNElJ/tDfTSU5MWlTCIKtSz1XAiTZwfU5TaCjekd8OcQIyUxjnffE/ZIhhD6ZyyqJ0FvOYu6ZeZt3nQeygR7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ROgLFPY+ybHZbAeeLJLotNQCeYA1ZTA3IOAPgfPGbvp03nWr
	KKoKdbapwMVLi0fA0Nt/t2I2pv6zK5de6tSwz1PzNPtzVXqyHJXQT9g56V3JfWA/Fr2QHANNFhL
	9NY50zp5U7pECpfmw/YaWW/ecnPK0yhU=
X-Gm-Gg: AeBDieukG0SYy63YrBzLJ/JNXWkNImPQD9w178yN2LjZfkVsGC63cBOrqPNmwQJf8wY
	inb2wecdYkmvFfsWv6dPdEm5qwQtLavUL5ChRGusk7461lN+lmNOTF0ZHTu69/M7efxd++LviBV
	nueJxf6w8jU2B3JHcUaBENe4qIhy4m9ZYtGZkkwKSyLcf7oyVmR647ZMIPgoPqj2KKzuWF5gEDx
	z+b0NqUeMiHuA66M8tptzJNbQnYJGAlsfUuBjVHPOGTQyLdd4Nh2yvL4pqOXKSZamK2vNFRkuUj
	d5K2vmQMA+fJU6T6qGfsMO6Ch5baehfy5883s7tvY104JTIda70L8ggh7MvuFNot61DWFaI/ilf
	SAh+nqKm97aj2Z4p2ftFoltT32rgO
X-Received: by 2002:a17:907:c989:b0:ba2:bd8e:57b9 with SMTP id
 a640c23a62f3a-ba3db293a22mr25264466b.6.1776364043532; Thu, 16 Apr 2026
 11:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com>
In-Reply-To: <20260416134214.130665-2-pontescpedro@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 16 Apr 2026 21:26:47 +0300
X-Gm-Features: AQROBzANh8oLFrnmWxG1V0wCfWO_Ma68oGU0AmR83s5_CNwYhIOcvH_YVlaO07U
Message-ID: <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Pedro Pontes <pontescpedro@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58946-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 42198413BC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 4:46=E2=80=AFPM Pedro Pontes <pontescpedro@gmail.co=
m> wrote:
>
> Convert manual kmalloc() multiplications to the modern kmalloc_objs()
> interface to improve type safety and prevent potential integer
> overflows.

There is already a patch doing it in a slightly better way. Have you
followed the mailing list?
Please, better to help with this driver is to subscribe to the mailing
list and review already
submitted ones.

--=20
With Best Regards,
Andy Shevchenko

