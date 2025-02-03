Return-Path: <linux-media+bounces-25589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAACA25B3B
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 14:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7269B7A1D15
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA59205AB3;
	Mon,  3 Feb 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="oB2RWJZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931CC1D5176;
	Mon,  3 Feb 2025 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590328; cv=none; b=HNEY4ohBNmJjs2ThaWNexTXA9fek63hgNxAvqAMToVqtqwgLqV+/z7VounaOaDSz6C3+EFYKvR41cWA5ZGTEB8URXF5U/WDYhWMqejHrpHeR1AYqU60yOgie2n39EQMQA4DF8cKbUMbcFmhaa72L+GiPJ5kYqCz0VhvYgUMEl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590328; c=relaxed/simple;
	bh=iL4VFw7hpCkHJMYrrBbsJDPioQL2CZn4VAQ9qFEwDYA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=N4Blt4D6lXGNLrds4dRg27MNH6+1ZrT003kd+oyWurcAJeSB0AUYSuWfvNkXCM43b0VisaL9WKoRz0rlmyWegTcbblVYZ3b8+KKutXLR527mXkEuc4hvDrY2/I2q7O8YLsaeors0rhFi9eaD2bqYj/cc0Dh5k11PsAm0J/fUZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=oB2RWJZ2; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738590314; x=1739195114; i=markus.elfring@web.de;
	bh=BrMaFaTHbjNz6cmKTtG7569JFcgiiXmAOEQFMA9TFPo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oB2RWJZ2YGCxROajQEFxhn9oBhttaShn8aL5il1RXZwEFSbsHUaOuF+R+KNpKK4P
	 HNSu3UU0NpbSADTajMEgMd3V6vdurgQa1xy5d0QzXdUO+BBKpoRcbYEzQZY+hXO42
	 kwOntGYb/UKl2VZMB13WWl6pl5FplWE53fyrm3QUD2zDe6XDp/AHrdmfS9Kkq0ODV
	 HNqZvjZNK8HGpPDSImXGo4ohDE9dyB0tGIdjJG3jVqS/f6LDeTjFWzWI9+/2RXhvN
	 3GAxLODMKd1CRLOI6cwc67znr1OxR3VPaOyf/sIE6FZlILQEnni7WEutzVv9WSidy
	 NvbXAib0imxquWWdAQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.29]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N947J-1tKj532fI7-014rha; Mon, 03
 Feb 2025 14:45:14 +0100
Message-ID: <6c32c1e8-0950-4bba-ac32-3284d144b142@web.de>
Date: Mon, 3 Feb 2025 14:45:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mirela Rabulea <mirela.rabulea@nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Alice Yuan <alice.yuan@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Fabio Estevam <festevam@denx.de>, Hans de Goede <hdegoede@redhat.com>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, LnxRevLi@nxp.com,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>
References: <20250124001243.446511-3-mirela.rabulea@nxp.com>
Subject: Re: [PATCH v3 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250124001243.446511-3-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N457mtSPHMpil6w0dAFIRluGF2eNRFq1WajiJUDwx3tduTI/67w
 30hKEGcTfnLHVx369mjN9AqjJPzjdFskbs2NQKob+uZviUB85lCgsMqc4ol0L1JdfX3hyD6
 fgRSMwb3twTjMXheIfT8vOneAqxSdDbztcAVOZ/LtQHvo9pY7TJL6UCb6bSxI7mU7g1H9Dz
 blsx8JXAc+2XesWg2Z0kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:se+8RxEol8s=;21++833pN3rnAJqhYhv6dTmD8QS
 m4CXOzFXfW4MOFViJ2nJbD8NYRrkZREG39bRuonpG4lf+SnHREsp/AXCuzng9SL1U16CFLKHJ
 8tMSJV0MME/yP9VktEidiYScXsEcjqM434YC12cm4XZT7kEeGH4KIAU20FBYscqCH5SluSfpX
 +TRBCi0XH2Q9igVCjeuZgKr7/zHQ5ZBJQnQfY7+ZJw6+1yG1FlkEsyS2UsN6VuGsWmtKq8hBz
 3Lt8bi1DQSKo+XRlCHJMtkY+Gf97TC/o+OHlX0Et5KaTNRlrTW+AILgRWFDgrNr6Cpq4nTpYZ
 JUw4lV2HW1TjXg4DRa9I1kG1piLSlMWB6LNz/GuSeFVA9Ku6iDeVMRDec8ZYtnQ2fycSYshvd
 3NUrpVwjixYRKJEcAKMQ1piO1xiGWNifHDUnDYPTJ0Q/0PJn4+3E0jePe7IPPSpS2qQiOWFDY
 C5v5yLNptw7kGiLKp1rJ2f36Zb5oxh++2U4U1oifcMHbeofmhhJjyct6EtHixMqLAMaRmwWeq
 LUvD2LTTfSDM6fhJTsX7HESeLkqkK0pteGc8PFco1p8GTvEnpqzqq9skibpXRgbXSdOeMmM4B
 7iwGu6i8RkUSPrYlVA5SHY4TUK6MxFf7NNhYvkBQPi6cajm0yF42saAiMMjESWmHd5oVFRH0p
 Sfztp8TVLec+2k1XbFOXr70tntxr9fVMAeZzNtLF+b1boQt+wIZ792OhYRMIDwSGtYvTpLMUm
 2921ycSOi4a6Tb07xdidQO/2ifIf+28tVPHkQb0HwAH/MAnzIw4RCSt6e9szqegCwd5kIcniF
 4kSw9wZ3Rjf/vnfNPrJmFGRWhMYzyn5g0AuJ9wzJyjb4mXodeCRY00ZIf5DZXX56D9nQkhaEd
 hCQVZobrRpfw7j31TXvLXpOcD8jkCaaGKF7ivbPHSqjMhySXx1qEEQ5+SCG12eRIdR/heKtIP
 xXWrI38c+qIdMA+NxHvYA7eYpL6MbbNM9wMZ6+Fe+ydo+xQei7u//AC5m0rfsN5EjhBiwHEsn
 zoHfVDRFwgSUAAE9cmpCO+pBAiOFiWub75f+daXQCoy2erUA75sfMjmxrMMPS/52fficWOvK7
 ofm0iFRWT4G25/1eai0bamjVsHCG22oTcs49QgC4Iu7jGVHdrvBnu9XC5mdQC92JhfXNsTwHU
 7rTst9xS50BEEA/nv6R1KViGyzdSO4P2jG+YPiZg7ZDqwXkGEjCkz5/mRaRhJEJTzErhhknyb
 C8CXwwWrkceig0mRgo+NvKACZCYH5Y4wsZoBAaTrk33xGLRl3wElTvr3vi2iM9c7V28OITwGT
 6DPEGuSu7BJw6sVDp5h0bDpEbee21vANirjufJHgqm/TUQ9jlkg/kn8nQAPkqIorR/C

=E2=80=A6
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> @@ -0,0 +1,939 @@
=E2=80=A6
> +static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int =
pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
=E2=80=A6
> +	/* get sensor current code*/
> +	mutex_lock(&sensor->lock);
> +	fd->entry[0].pixelcode =3D sensor->mode->code;
> +	mutex_unlock(&sensor->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&sensor->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/mutex.h#L201

Regards,
Markus

