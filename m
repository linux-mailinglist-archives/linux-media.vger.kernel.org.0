Return-Path: <linux-media+bounces-51452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PwDKOjFdGmt9gAAu9opvQ
	(envelope-from <linux-media+bounces-51452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 14:15:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F437DB04
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 14:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86706300D45C
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F7C2E040E;
	Sat, 24 Jan 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="rSRS2IQP"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F5318BB9
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769260509; cv=none; b=TmRTwq4MLT2oH8fKsef8g5FsN+HfNw+rXakMHp3K0bpgUT12WW/0FtVCLwc94htckyvYabnAYGkU/Un22txnMr26bE7E3+/zwPlpzAxxlwzpe4/ufQqC3bbCQ8dBelMeI6QIU3fixPk1V7ciRTrwKG5VQiWanwqOs5UmHHCoYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769260509; c=relaxed/simple;
	bh=GtAlVLCgyR8wbqQsxHMAT5Bzaa9VE2Y7bjC4iGWq+Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgl6J/BZ3cV4NHgEm2h5/Xtz5TDD6pulhnXl424eNNsXr6bvsvGFrW/lGK0ymLGi1KmO9kjTfe1G6ID9EghXA5EW2IwtArgq9XWX9frvB90eVp3TJ5XQpeU90eSd23yjzPAyD+ceXkyEfsFs75zsj0cSA4OqskgkDJdfPSlpPro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=rSRS2IQP; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1769260481; x=1769865281; i=wahrenst@gmx.net;
	bh=GtAlVLCgyR8wbqQsxHMAT5Bzaa9VE2Y7bjC4iGWq+Q4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rSRS2IQPmJnEY1CF9zJDYUC3P2atFwOssPFwRFrVzqQcB3t3KL1bVRHTEOMDmKt5
	 WLbSnwaSleUeGVRSrcrU0nuZgREAIq7LWk5mH/T2X+AprPm1lY0eP82IgSKtaTpq/
	 YHCJLRs3VUVUVHsDVqQryG6O2ck9fgyddZIbNMba/a7q/hx50kDsEvaPq5WEBNZld
	 LKgMB9G3XT+XuxORtmvLzvAiUQ0O+/h6qG7OvaKXZcEKaIF57mQEL4e8+anSg5Zi4
	 FVy8HzBWuWWzuQAIIqmEPutqeeshWwJx4lUg/GGKC/pnZmBEJ8z9SloHSawfJPia9
	 FlDj333xkkv8cezAdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1vXJY20k1z-00G7dq; Sat, 24
 Jan 2026 14:14:41 +0100
Message-ID: <4003c61a-1d3f-4deb-b1ac-293cd5c8f2df@gmx.net>
Date: Sat, 24 Jan 2026 14:14:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] media: Add support for Raspberry Pi 4 ISP
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.org>, Umang Jain <uajain@igalia.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
 <4dec6316-0ae3-44bf-b23d-8b05f3c2c607@gmx.net>
 <176906351709.9154.11222619502063088695@freya>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <176906351709.9154.11222619502063088695@freya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sg0mUwNd4e4R0MVc6ZnIpJYng6d2k8VDKINY6KGg3yS2Rqevbsv
 LvaInL3aBUmk4qn087/uuM8KUWGBbAC9k2rTZcGy2MbdS4os6TsHEWkSTjxv/Mf3lt8zRIF
 Csm5Nbev9vgW28ioGVwamQj76jvh2jB+UKrkp1KhpuPHmW1mMGDFav5et1PwEekNGVoCKZk
 sviY40IKh1uGhRMsnuD8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u+GLRfYdk34=;3scIIoAHewWKAbdlBkjOpnkStQa
 /KRSgLDtMBSuagiiAFaRrHIY+KA3vd4oQiZlcyA6OtGmnaxWHrMMWy9YrVJH+yQSu5s6sg4Ns
 L7fWn2FESCXM0KI/UHKvUzRaaDF6qBibBpdrMafGvJ3ahFru1znfz3Rf6sc+AJjLoadFWUcpk
 w2Q/9Tkij/w4W0IM9blx0DqFOpP8rr+Q7744zm/12nwZ+PXs8ZfaR85HVyCPjtSUJYDHQ9j5f
 z+wQYCLpjYA64but5fI/z49HS7gYo5IL9IAUNLiwnhhLsNIr4WRexf7e/7ZrItHMr9mzc0b84
 jbREAVjxTSlAsfyMlb88qga+qC/547FwMZR5FPOSeEgIN8mHBtUnAB8KRrqSiii913nFij7WU
 FAlWFN7p5Dkrh/njChumKEwq3tPqrprxoEw/9lPgDoQThsuVbhrgdMlPtlUxGwZNmmOtZxr5/
 O1FHHuB4IMeJC5Qo0vPQZtCTRpqmAgRLO01nIoUBkBOhTjd9YjKFk3RhVJnZFO0Ib+t8+ElKH
 Pgrs4z/QsxDbqk40cSIlFBa7GdJcJT7jUj/XpxLDpznTaxdhFGqSGdoC43JdX05/SUb8TITq0
 Sqe2Uy+z/L9iAqyUlg4jrH9EWCWFvVGKTrXSCFsAFCzPF1zyBRPB6IhdUB6UkddihOcuWkqr4
 9tIj85Y8G5/2CL/Yvge8xPNQS1xbEbx/pFLKZOEhP7zME/1e3PBBTKILcOnViPNsPc12GrEli
 8DhdRpqwFapN0YHA+04yQ8wUPRqBN1oM4CctlE6JX3dMm6NwSh7Y63nmoaSmZZvt3j7QGWV0f
 yuFQOhb4XH7e6lTSGDmyZfnQpiH1SVGDdWBh2SQNGI6nPikQDp5ziFAolVOoJ5UgVQiaHPMFm
 93m3a/yZcNs0W84GWkTeNTP87TaT+RYf3T6qLrVBayTLxPdbKc3bmtJaYljxLaUlMtPy2r0MT
 Tk5Hsd/Rxm0kDayrhtg+mjEfqbFyjvPDLNvayKL8DNvHYvlAHbMWMXABFQHdv1+XBUlVQW2Qq
 2NN/ttlFtFCtRd6uPz28WnYvoZPCF9NaBg8lfSrtgFAU4dhe7zBCH5kNboAHr5x5skwWYM1/a
 X7QB+rKVZLMb6ERwcQ0usIkt/BxzI6uD+w6ZcmBIVP5oOn5LXWTKXbcVPZT3wkpL6gC4Tb8AY
 p+zrvRgoWivPr9LgMMAf1nW/THpLh/TLDw/m0rHZ9023EVzyTcKZxOnTrgMm15dezIXULD6jL
 BeTSqMon+4IPJkkfL9pLgdfZB64PHX//stL1ZDTbPcicdfgmre+zicbPCSE137v6OFwCtBN5H
 L/1gkBGVpCmAWCxLdALsHTjcuumzfgyN2hqr/AqM2ku6E9IJ1phzwgLZzronn7IvTvVj7xRmT
 /jkikmyhNe9C6L6xucKaT0FVMx/TNSyk7TeoiXyzh031mN76KdULtr0YQy6NmtR9i/iq+TcND
 FGspKoCH8x7WnYUX1ZatAjCBFVAYAdinJKzFIudHXvKspb7bEGtrjtlLTSze0DiEWxcsisAG5
 9G7NQMyMOjwU8GJM5SJBXPdmFAYeTFZC+u34WXU0fFjvqXQxd7t9SSYZpR/9sm4VdorHOTTN3
 lNZMSK6cLiWBsb01iJKDX8WVXmVUKl4ygoVW2jQmlfkbV1obmW5o4srbpXhAufk+fslVGed93
 TDJq5oKgRgyAbRC3Of4dCeFBCVRIO/ufP3M59jzLzXmGKdk8Qp2+h/bdyLpSBbN8GRxZy5Lyz
 BH/PhoXGOBqSjikjekrHibCR5qU4k2w46YdYd8au/PPniks0EvEuOyLw5X83BohhgRuzhOTNz
 Kf0QE8RxJ0sbma9VkJ5NgpJ5TGqsvgGtrMhHekx2LRW7IHe2sE/IwtpgT9l8vcjZhR0eVdFaU
 xc3mh67nyhvEdhywYLVLrCTRNw17/qL+PJnCxEnn0Mvwlmb5NT88wrZ13tQHXFBtV1cm5Xfd/
 hEHcraBrltcDqomTdI/ske4n23OUWVWGTQnrWk+47jl1lF3Wc0BSl7ZRB/JuJTeBJCZe9UUun
 2McvKCFkQSgvEss53baH5leuFtIdQruVah8+wX7Icubff0vn5NUTDfWemPwgWY0ePDQPQo/VO
 C+RaqflxOQepm1r1Jf0opbWaut2RJcBj5/X2h08gmCCyI7twXc8hXRA6VPR3d1BcFCAr2oWDo
 EIV2otFnrdyD9cVzdgvcvn06O0TeNjEe9z4wfTnR279oFyNM1louPsOn4DiKzA3lwokqS6aUA
 rjpxs+ci/cM5zmOPXAndc/OCjhFmHpsoIZ+djEq6treT4zfT/1VH/Yh05/Yt20sd8rQtLbyPj
 s++D/n+i7VcwJT9iiepppNcTUtUXIJjRdN0ExyO7smkR5pMGqfZyx27sRiL9B66s0Cjw2CtAs
 avSQJ+woTV7ROYxMvZSIRkIHjdI/Et6vLv1Wg0UlKDWH9Q/3Ss5UEyAccJRrRh6dLVNmjizwm
 dxmQ+e5jH7JECvsgThCW3MH3vEmK4dFcsO9Bxbp4m8G+RCz/3oVJ9mY00g0cwGY0RIpqlAHu7
 aQI/YsNKB3RwVIFV6fz9tnkHeSNAX2pPPirHqS6YNvFr26WVyw594fL2eg00r1FedHKm2jWfS
 +8tg6TPHYIj34xC6KRcFFF8ttq+VChKyOpfMBijXS4eHAZRSjdlS8Xd0YK8U9NhfXPXq5sp8A
 SWLufEoCPwrsgMofXOMPqddjSG057SHTwaZRoJhsdgqVAbvNQBRyPgqlb/mliX2fSBudbmBun
 rWy9PYBv4ZG6Aefx+t0xQqMLsHodYkngHk0XbuhtvRs1dwV2tS9vE8/byVpQIgVPilGPxBPnp
 gJIsvNC1DG4K49z9pv6eVN/XV5AMiUkjtVkzOrJbCXaldwWLoK6BT60WLMYr4WtI3D5AdRuVp
 Pflm2FRRSK38K0WMBWd6ncn3o8cw4cLItAtI3fpgLg2bQVjfzkZWvp0YztBC+fgUK1RfgIQMg
 73SFtqyzYd6oHSo5yh983w+MSSYQdUeMmHe2L8zUMsIJ+A/slji+ICPy92yiuqxqQIjv53SsP
 Q+HL790k1xMYCpN01VNUCO66Lxu9TOtSUL7OXc9+eS2YuIYrUe5hQjHlpk6exCY9PqsdmN9V6
 jsJPsfODUYR6wCCJpiZA7EI51etAEkUCE75ThEE1Ed0R8GVZjBpppCm2hcNf4VQXeY+FWdDf7
 AAQ9+eA7PIl8/akQbrPz4wsdVjNQrOLA6g31KeLWuWtdQsu/Z5jt3DUlYknIFv2K9dW/ZGofC
 ZJyxYFy+x0XSL+zyU56H7VTSzAVqBVyo4MMeP3j/2HmnpIyBAU8F5WnpK4qRYJZR5ZYAGCu24
 gXhmk9HbHwK5iGTS5i26Oc6BkCc3jXiJfp2wNmjUj14g64FL3yZ4yl8vMwEMTyuxVzo1UfSmk
 QSHlQla0mwpRcaXr4avfwWw5WInsMvI6Vaq7E8gH4fcc7dRIOqX2AMpIbfCWUyRRXYXzvbQyi
 vVJqA+sjGDTIlcIp1pUfyjLdQKXCrn3Xtwa4KlGe0M1jxQD59WeGvec//op1jDufukfj7bLyb
 mFN2rK3I79le+pUbKIyAnrId5uWCC/UzjNz3R3F8olSvIFwIr5oinT8v5ErQZZ4w9hNQTJXzh
 YXry0z9YsUdWw/YfjZkGqFcjlpGX9gVP29kQJsHFkP59gP+YaUjzFOjc0jnzHoiQo2YeCTyP9
 MAZNY1Z1HIWo7CQ7rbsXHj50IOIiaTtsQxMSdqtbGRL1c9EZpn+E8EKMKKfKIKg/Ujm6NkLs8
 3zlr4GcSpPesW6+/qNLic5Ur6oDttxUmLonxxtmfcUuufcm64EZ3PrPLKCGcI68Osw+ZtlGni
 iJfwtbYXOhATLjsu98lKQML6ut0KDT5jSiCHc5foma7K6e0S8S1rYgZNFB18kr9v5yi1lf8ah
 nDLYW9SC8Vup8DA3xc+ONMRM8gGZz6bIS53QKenXNbOZBsxGJfjghqPYaQZK8nvZ4IuTD9RTQ
 0WrwPLQ2IRVtk6XYt0HUyLdrSZe5j5QrfzKzny+UAwVR2DH6gRMkk/Uj4cm/ZDMzWqTKPXhOg
 3izqgM3NZS/RqoYtMcxuR5v1RnQSWizG9Z2mWGhSH+KCOoK8pU3DOfsbR42F17WVvn9T/GnQm
 M3uB6pg/QTwc2otJAw6Qz/ge+Z+pnVnHRafrSY5refLzd6/pQXlm5uTQSPzkWk2/9hYZdWDwd
 ygs6EfBAzF9xq7JCkOW4fQBuY9PjmdbJ/rkrM9JCyavPh9x0gJUmSPB2kfIvQp075wlHeDkel
 77SZlmyFwx7d1TKAfGheHLQF7i+833vAdIb/AcbnS9eogvuFdhIRqHr4xvQxPfCiTHhnpXDxg
 CY2ZGr1QMrKrd79MdRQUFDBTw2QQ1OdV3f355dg+dBZ8pGQi2zPU0BrlGULil0sIlIVYYnxqz
 91IKiPHWv86GxYq3dK464TxCLgFk1v6V1JLV7NsDkSZEGmcuDGbYG9JAbfHrJ5xevehujd1tN
 yuLNuOpTOymJgLyH9uSQrhaZllV+ZNw5Ri0BEThQjsxiVFLr7+9j1iMioKotfd3noQ3St6FpW
 3T26jYk6wEfL4xOkeTfCKY7Oi3xIsnRwAFqhZ+z2+qeoP4b4RdLfehxztnkfiEVXZ2aGOvOUS
 2KDiGRcYjM6wAhzgqY/JMYxQLg0a0FhsZVYZdCyySpcLd/ZuTtO9IHI2Xj5o2M9JMnB3yvCsa
 VPy7f997qOhl59eF0422hoHWClGGxd6S3J1RLSpoaLr6imQAVDjewCVfoPSnYSsbccmn9PMjP
 OQrdbKOmE2v+3L+a0tz482MqdOdr+b3573NUbNxr+A1RPr1hfTJXO0wdJmr+7cYAU+KABP6fL
 PYEgVOA7G7BmMs43DCVd9J341nrr1Gr6OGLniZw6nGd1CN6bw+F13XQpcHYjl6pvdwqhDCpsc
 OOhul4XxlUWj0oZemGK7UHyBOr/yrFrkVkQQhtXB4J7kYYdDC4MPOMFIdYI/4zf1HrMIrHRaV
 AaTJhwbgxoqJ03hxzBzrNqf/XfyNLQM7yAe5ipnaClvFEjnk90CT94vxO7hG2uZu44xkoT8D4
 Yor7Aat4xA9kqNgEnI+BER51IlhWXJtZ7fj8g0wcJIDQQYGVEnQvIZH4+RsJ+5hNuR173ALOW
 f/i7OBVR7MMbI6aKSb9t0r7ysqFTeVg1EpFbdSnEmYm2flW072R8JBWRm8WeIjq3VCzxQRQvP
 Ji2iAOA8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51452-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08F437DB04
X-Rspamd-Action: no action

Hi Jai,

Am 22.01.26 um 07:31 schrieb Jai Luthra:
> Hi Stefan,
>
> Quoting Stefan Wahren (2026-01-22 00:06:23)
>> Hi Jai,
>>
>> Am 13.01.26 um 10:05 schrieb Jai Luthra:
>>> Hi,
>>>
>>> This series adds support for the ISP used in Raspberry Pi 4 (and earli=
er
>>> variants) by adding the bcm2835-isp V4L2 driver.
>> could you please point me to the upstream patch, which enables VCHIQ
>> support for Raspberry Pi 4?
> The VCHIQ driver currently in upstream is working fine in my testing wit=
h
> the ISP on Raspberry Pi 4.
This is good :-)
>
> arch/arm/boot/dts/broadcom/bcm2711-rpi.dts inherits the vchiq device tre=
e
> node from bcm2835-rpi.dts, which uses the "brcm,bcm2835-vchiq" compatibl=
e.
Yes, I remember this wasn't intended in the first place, which resulted=20
in situation that somethings on Raspberry Pi 4 didn't work (don't=20
remember exactly), but fixing wasn't really possible because the DTB=20
files has already been shipped and we didn't want to cause a regression=20
by excluding Raspberry Pi 4 afterwards.
>
>> AFAIR only Raspberry Pi 0 - 3 were officially supported.
>>
> Ah my bad. Do you know which peripheral requires the changes to VCHIQ an=
d
> DMA to function properly on Pi 4?
>
> I saw the downstream tree defines new bcm2711-* compatibles for the DMA
> engine and VCHIQ, mostly for 36-bit address support. I had those patches=
 in
> my tree at some point while debugging, but dropped them as the issue was
> found in the firmware clock management.
>
> If 36-bit addresses are indeed required for some ISP feature I didn't
> notice, I can add those patches back before posting the next revision.
This isn't trivial, because AFAIK the DMA driver needs to be extended=20
before. Dave Stevenson send the last patches regarding this topic.

I currently don't have the time to review the series in depth, but I'm=20
fine without 36-bit support as ISP works on Raspberry Pi 4.

But I've a small request for this series. Could you please drop the=20
suggesting passages that Raspberry 4 is officially supported?
You can still leave, the statement that it has been successfully tested=20
on Raspberry 4.

Best regards

