Return-Path: <linux-media+bounces-51880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOBaHSCgfWnMSwIAu9opvQ
	(envelope-from <linux-media+bounces-51880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 07:24:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC26C0F22
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 07:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0D8A301016C
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 06:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB32E31DDB8;
	Sat, 31 Jan 2026 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="t6PyH5rE"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160111EDA0F;
	Sat, 31 Jan 2026 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769840662; cv=none; b=cfhIw70wWjak63Pg63mkoI/S5kiFFQqg3v6sMvtH6jY5tQyANNEOALruzC06yDjNsexjcDc5qdV7iq720rjFADG6HulRY6Gn8rkBSjy4PfJ5iyZTspnIHD6pXWWJk+jhVr8ElWN6HoKjlgHQMo5yj5N8sU4OlEMhJR2P95K9RAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769840662; c=relaxed/simple;
	bh=Sk30x7IKpAiC5ZBmK4z860az2B2mDPfat7WQedHpveg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I98ehbl3oMtGQy7ZVDitO+DUEx+OB4nkpNTvJzEd6qbvot8oANCiFie7YbEcWV9F1OjsH8h7aIrbi3H+dSVhFMUcgInD/GLP78iCR1MLJBGbFEznTgBOBIilCIYsPHBtqv82RtZagaBHoANshJMjHJ2ABeh/vVYxx+PLDwQSv6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=t6PyH5rE; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769840652; x=1770445452; i=markus.elfring@web.de;
	bh=Sk30x7IKpAiC5ZBmK4z860az2B2mDPfat7WQedHpveg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t6PyH5rEvS5Sdr1VxszviYPlbjlGQ8NTUGisIm4o1RPGSoNZg3k0VZwlDE3R5ley
	 zab8nbjwW42aeCPRZ+xypBpPfPDgmZ8C6mCOlULoJ290lIPhh0275snuXM+f3TMsv
	 Vp7VCKvVLsi4wM8SG5K2wk/V3XiddGteVUWXd28WtJ5ynC9XhVAdRjOcEbjPGkVdb
	 szXTZS707GRR5AwodjZdbz3BjrjyYeOmy1Ubtw4aiPTEYQ91WzkeZZSgwZsctIuZC
	 fjq/bJwLLaNXPEF0CoJqF0ERNyq9tQ+fdYZ5wq97W88AUYewKLTJMa0fp/ggprihv
	 3sCcswxgLm0g6MeruA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.223]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MC0LH-1vZfwU3wtB-003LHT; Sat, 31
 Jan 2026 07:24:11 +0100
Message-ID: <c66d94e8-296c-48ef-a298-941ac2250610@web.de>
Date: Sat, 31 Jan 2026 07:24:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260130041815.2988011-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] media: i2c: ar0521: Check return value of
 devm_gpiod_get_optional() in ar0521_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260130041815.2988011-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Q+Dn+tllf9RK90/c2ulDQoy+lNah8KKiwKkH0R7Kr2QUBpVJYD
 RSVwUWHnH0ysgi7PI6MaSszjM5t6NiB2e0g3brk09ioWE53a2cCL0KhrftKO8CLUBjTZI1f
 JCaTbVDpUjY+ys34vcMkSrVyCzVhNNE3VE8ttlkgFrC66waWD1aKtwrVOz/X99rcl85ealF
 1Si8Bib1eWBKQWLsc1heQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NsYN5XG3VnI=;ReB/ULFmI3XbwW+OB+ZnmCHWeW+
 a6E9tVOaV+Cx1c0X1IFTxrBEZk5aco54oCyyWfefSqQrFHoI1VMKEbB1moeMf+sWM1oHdiVmt
 BC071wqjwKwFqySiTCO35bsPNnthMTY7496O14htTMZ0LOQCI+43/LKci+EHYCVFfkyGzI1Vm
 DvbVjWFcDM7Yfylf8OlP7+IjwwOgS8gpfRyIxu10S0jHUQZk+sc3rr3AdO0juRy2qdTNA6zxp
 fdvxmjmc0kqqR51ENhtA9fL3VAeSJYLTtbCJaXNIvUFEX/j7tk7Y0EINcJscF1DW+Yp2NAL4M
 m/ir/2DSmTPThImwqwKMrrlyTCKLrH3sdKnwC7rOS7FNvFbahfApNBq6SLBncP3OcGsDdE7r2
 4ufFSrhX+oU7h+TCvtJSRIUCSL59w9HgBt8Z6kZQJ96DA2mqYL1Qz9OdQPjrGA5z0guKwMtIx
 taY9dlQiNj/aSikz9zoL7Ywoe9HIG9Cui54wSKZ2Tt6KOvvnk9UF+MhJB26YY7ovUhA6bhJ3U
 tNIFiMCMSfjL4okHkQhLpmVE/cK6XMU+k6BEdPbDrEFl+sBpn6dI/cDphCPa2zTDfi3Uwc7QY
 jM3g3awDzX2TZ8eNII4pYGWRpXrDB7BfqnsV4yYJf5uyzve9NbW0cRmAqpzJcyfQk/2k9m2ai
 p+PpLXWiel/NDPrZFpEvasm1RkHWU5IqsPYEIZb8RoQPW2SXyG9ZuCv9ci0Z6HbICinfYu6ln
 ahrYNcvj/jcmOK1VC32yOO/l+fXu7bdMibQWgpEoy4GSk5eH5+fCXKns9R6XeO58I6wr1xHTC
 zoSzSfnor9YWap/bbzAgb4wRTaAPK0YjuT1aTx87hmXQ7q7auYFCrAp4/aDjyTUBJvnJ0T7My
 Xizc3KXsA6v46ttMMmjvyhc3JnCWnJly/vsHrg35hd+PAH5AYW1skSwOCcDkXHC9xyoFUJ4cp
 tIvUwA/BW4DC2CwC+0XkFyqglt5v4X+Ac58n7qahhUKQSK/B+oUENgT8H4p0CiUgV74IaJkeA
 8JsvrGDbWhEeo5qxuPZCvok5+gSwPkLFQz3OVU+Dzri5Mo5qqWYlt9OvojbhAf8t+9ge17503
 fZfuetMH4MJdgKZYE/Z31es2hZBMXRqdAuYv7+wuWnwpzvLnYL5DQUL97tWqXDk1DhTHF34jJ
 NhuSGCEnJdsWsHZ0UhMpLftFQMTDbgcm38dWNpV+yH4u7GukGksXvYXPYLrbET+dChmVffwW/
 RwFsGaYF+3XVn4weCC/kIZ2xRVJdI7hRZJfjmIEPmYd59xBeLEFnPAffuOoTaOgyi94YEnMDT
 w69TZg+G2AHwCdUCQycWsQAtmW0rX9UyuWUKKHGhZcwQ25kyMe+5dU9jSCWgI4zAXwfwA+LcF
 a9YTlMxUEib+w1Fc+Ljmt6mAvULfcovSJvXcQWl9RVmqgHMUBOueXufLmdExoZkbdJNTcui4H
 6YAkF9ixsMJCGvjrvVfDHOM2pK2sYhpoife6BEF3q9q8+p2x98CQW0jtdAhbhhKwL7AZrwVIX
 nEheCeQsgRCIRSt2dsnavh6dCyJ7DpVTccgHGyAQ+QfJruCW9SJuFEy6+6h/6S3aFuAa6gI0s
 uUIXx97TFqVoO3hAcD7FIwn8Ftd9UMZ0KNdkQhnuDyV7lySHLvQGhTfQUIAEPINz88OLUC//1
 7g0ezwRTkT+jr3CLzGgXBAOYdsCo2q29wCvo37uxJqzDQ7ePLBcEOoQLY858vBxkpv0tBpmSS
 mxphDTwRnfs4oAr8XuYiWgHssHbkY3LrAq0epmCCUfB0ncl1S7USJIF+Gp14hUx/K/Wu/M9PG
 hAvB+Sj5wrc/x9PuovLY6gAAf4zMqoNdX1pR+gRDBkCtu3PBketeDWjq2hHNsstmmabIMopc8
 wXCEKeoXQYAUZ6epwUO/UXdLDZKhqkIDzPS4S+s/IgRr0MdC3Ge9pzDeuM3PH05+J0nvbxceO
 5b1tkmux3zPPEiO2zTvkN80cC4gzniCB8jg36zM6+VU+qcGyj8R8pAe35/O89gleGYDZBfC1d
 eVrOqz+gsTH9jhyQWE6OPDNGcvcUNnxMp49tTyE0MvXy89oPmfN4NR9j96sv6VsejXdZol0ti
 JOtTpELP0HDx3Nq7DXqxpzT7XKrSX2KGQoAR4JWJNbB5TIrARog9bup7ix9Idq7QW3a/dOJle
 O3SnXguJgK4/muzO7aCv0MVoi1h5UDc8kHCbTlgSxuWLDt5Fqc9YaNTNf6qq9o+fdNS2LfDjF
 iYIjjwMg3/JdCs1vraNkbVgCtZZfE8aj0fce4TqYbAc0yCWGVl6XH2N1HsHBWTDM+/Uk+mTRf
 prZXcKcYo+5g7EqbDHTJW5qnOS7+qiIO3MDC4Rl+gG8l2cGbora1OLa22WhDfHgr0/Ilj+YKC
 M0gLp5WlF8A09IfgluJulyBXGkKPbNTluE76svbVzHHjyoa6v1a9aXMoSVMqzLSSgDk7lw1YY
 Xft4g6d5TZzDTbUsVwAuKQn9FJVWKwhpLVVfwOR2mfyX3bPdFT3L+O0G/jpeSsDXBgiyb9fDI
 cNUfPfnxualvfkwvOJBbHHe0ObEyk3HLyspMagFwjQHiZrMXOJoJIobEiM3lghVaDp5R0Z+nF
 XBRcwDt4ymGMAY8R1jglz76UBmv305AS2rcb7LyJ8ZaPA3+8Umdup119nJk71gMN5H3RXSFJa
 XukGKgHUEFwsX6rbrj968HG/FrGN2hhIWMc49zY5Vhd09NcRRQToUZ7dqR7iTrWc5IAKH36ed
 A8wuI1kXI4/K7grKLnWd019HylFmTLMMsmr7Fyu7sDhowWwsIQvHFsFPZeuJN1HFanLFPYMKC
 rTs07sQr3/EQzpvqQKFnmZa8p8xTAKu+eQ5mT5YjcOo0kCcoHp22QchSNmvMTINj2kt0ut6IR
 TdBE3Xa9Jn0+i2i/iTcRFUgjjyJoaW2GoLczU+uK4F11k+reZjCykCMstOvHHExAHo9ss+U4s
 2EPLXpzjxYpoQsN7gHHBM/4962kzn5W1doUX15arBkQkYX/GChFP0AC/ZrhYdS2/ovlVE+w48
 sB46v+Bmo07Rt87fpzyRUwLuxY0o0h8sGTOkxFtdTEgBL45ImjM1m3QkCoYPip9UfUvdgiRER
 sqaqXJk1mJf74Wgxz2Fica6SJU02sstcMmbEm2755uX3v2P4KOvl/bwjSJ/ISYD2bQlluXx5i
 7K/Xl1BAMme3PhVolV7fF4D4PTeANoCuHXuJKCXwLcB2W7zvID7t4YYvc8as4Rw9ArrZO7Jit
 1iqwmAfdnGt1WKSGuEmec9VcxbPcl1JSK5Wz0T+khXJlMNkVUuCcmVpBSVlWHHwN5bBsGMDnG
 x5NXPT5ZUVC7q8CBESJf4HsZlzh1YhiRFrWFOFXEdOQlA9KqKNuPu0YV9idw2KHs3UTavO853
 KxpJmzO7mPZp/XMw7yQs0sCG1lK7KBQuHZ9Rqsjz7Td+mSE/1GawAYez3v4u4bkgQejDYg5Bn
 ra8JZMtdnPjXZLfQTSxzRvc84Y3XNuI9IFXOf46Uv9ElIWSV5RAVbaAm7gUfR8BUQl5N96jMk
 bz0L39N/MUF4PSuiMTr/OVjSsTIUjqbVCt3+IDRc+vnkF26D8oQnxHRc32qrN9Qxi7v3/lHW3
 eEBFXcaRBzd+WiR0RidGlaYNLbnxG36sYxiKtJ/3iGmCADsytWQbzEOK8FIuL3dUoJENkct6D
 ixYTHQdidVPre3RSdnwTl7gCQmGq5gLqZ/xwAp4URgq1k4ld8ccaj4hzZmoXZ6kdOT9RdHfte
 vabK9HPLx/dS+lt8eciBqfaiVpXgVyewEBhoJjQfuZ03esT6YMZQqToWnbQ6GZ3PkceEpGgB7
 oZCJHqznSKIkSNR+8uAekTJTUjgBcQycM5cmhBTa+EjXwIW5A/QbYYKffG1UBcDaqvqXZM8CQ
 c+K4z+zFxlUyjp0bSaG4wLz04b2JuNbdIHdu00m+nWO0oH/VAMse96ewe58RT9TJ6q9tc4UJi
 TEM+UzO/uD/lWKArMRvxBYggwvony/BURiy1zReQRMUB3q3xNoHJzFwb5wvOT39PW7GVZ9mj+
 xwalWSh9kuUxFL2wp8nlnr/xyu/8K56GfEgCCnXlyhBkUTEzFqGEXus3pwgnf+3QmLi5GCsCw
 +1cto1rSk6k3X/mznugnRCgfsCCuEz59XHkOFGH+LUiLOnQIHuDIBJaO+EfLDi4VAz8NUfRz1
 DSMdNUB1IQDJZMiKEQFjx8PkJTTQOpXlXJbv2RU2yhQmXurMSf5A14JIyMYkHyLEpf/6JmcMU
 9czEoBXwZ6R4r+jG5h6/k9hr9wazIYhjHkk5hhQXwvPXbiE2ll80aIYcV8lzeYCGr+Sm9oofA
 nho3I2LPuyvlLCAekZB2Ue1S2rBp2+Niz+95Pv3pUbpsUN5ff3fFKvhyIMLbQSznEV5eqI7zN
 /PYz3ER5nTmWO4GV5dmBoeQts2tfsJ7mOSZmqYJaGys98T+gy6KYVkH2I8t2xKo1dkj/FMwcj
 Ixy+6gOL5CuYtO3fDpdxsfDZ+xuF1OUUiI93s7vzW4vEgJwcKTaozFW2JJIRNTk+HdwzYD2cF
 wWj419KrYksa1VwawpvjkxQVswBvJOB3SPlBEn2t6uKMWxfalIuL8vg+pDKvJkZYrKArHgLWc
 +Mmo+uy6vwA//BtLX/zKHQP8dwW7drrxu4P2Gy2cAUlVlf3GXtZ1SAYefWi9rKbV5ohhxlqTe
 11Z3HGXPDHyuSA7ggPO8SKDCFArP1BYEiol6jaBnxIN+rMgcMZrtXHqWYdtgr9rHKvrtPimKo
 opZIKNHjsbKMSNUovKpA2jEf/9Cmf3AtA8gOgpeIv37zX0CwJF0p01ne61dW0CWOF1cfCrJZ/
 oIfFLlKOPu9JvV0IQm3QxiQmJTzEFSNXIskT9OSMux0A/IuZvCLKM9sJXvSmx3nsv3QVRJjTs
 wUa/Ltdxqx9mIYW6U91kFuWtknMhBZsTAQ58JEOcMYUj7VQ99WKXvRQuMRkQOJzzTY1rsANsE
 EMA+LWjy7+TtUPk/8jhktLY/un6Rs+fUTOZsYhEakyDmLImzAEEdr8jGk/kI2QsYTOf5rr/iq
 L9YtrSYy/0yWkihHROmIs8cmWpL3iA2ZHFo9PbwjTAxKt6IVmWZRKArVJkgGXPaOxsPbsJ5TB
 rqE1u98cGBRafAQQAhcPqUZ061M5/rKyZBvdDpaoHBNMJ5ovYQSJbU0FyarOJfU9MxFQ45Krq
 NUcQQnMlNa7rleAZgb58HIUxc2la2H9ctKCbRZ5C7Ma/6q/Katg==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51880-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CEC26C0F22
X-Rspamd-Action: no action

=E2=80=A6
> Add an IS_ERR() check after the function call to catch such errors and
> propagate them to the probe function, ensuring the driver fails to load
> safely rather than proceeding with an invalid pointer.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

