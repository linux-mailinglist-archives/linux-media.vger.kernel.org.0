Return-Path: <linux-media+bounces-472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598B7EEDC6
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 09:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49851F2630B
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 08:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143A8CA67;
	Fri, 17 Nov 2023 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yokiESdx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADE81AD;
	Fri, 17 Nov 2023 00:49:21 -0800 (PST)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AH8aYhJ005749;
	Fri, 17 Nov 2023 09:49:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=QKT/BbvuuLqFyTHfMeRVQ
	6bgO8hrF5ObSu+PK0LQuFI=; b=yokiESdx1OWmgjYc8s3puTM8OiVUeMXL4GJsq
	StkJum325rJ1mq4kOvHgZb+RpJSF2iAXxfVGcrdykyjcMU4u4Dk6DF7vmvXV16Vu
	2yIKxPHK0TjVUD7kKdn1O7wTRh0onNBChD2kz9ytk/2mQ1X/sk/2LsutiA7ii8S2
	VSKsOevKrLQvQpsC3GvkBd1JwJXZEqUdUd9+UYR/iPf9JkQlG4cT2N6w9l7q7Vpg
	sulB826Pc+re1AIkPK9tpYvYEG3jPY3oLaaO/h2oQegkZvDwMa9GHFvsrBsoi37k
	vXCYaBOysiF39w4pT6FteHYPEyeOcwYCE/UIJKii0c8hI6skw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ud8c5empr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:49:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24E2610002A;
	Fri, 17 Nov 2023 09:48:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2EFB210F71;
	Fri, 17 Nov 2023 09:48:59 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 17 Nov
 2023 09:48:59 +0100
Date: Fri, 17 Nov 2023 09:48:54 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Pavel Machek <pavel@ucw.cz>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: media: i2c: add galaxycore,gc2145
 dt-bindings
Message-ID: <20231117084854.GA523678@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Pavel Machek <pavel@ucw.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231107081345.3172392-1-alain.volmat@foss.st.com>
 <20231107081345.3172392-3-alain.volmat@foss.st.com>
 <ZU/QyrbaeyoV5+ON@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZU/QyrbaeyoV5+ON@duo.ucw.cz>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_06,2023-11-16_01,2023-05-22_02

Hi Pavel,

thanks for the review.

On Sat, Nov 11, 2023 at 08:23:13PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Introduction of the Galaxy Core GC2145 XVGA CMOS camera sensor.
> 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> > new file mode 100644
> > index 000000000000..94d194cf5452
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc2145.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Galaxy Core 1/5'' UXGA CMOS Image Sensor
> > +
> > +maintainers:
> > +  - Alain Volmat <alain.volmat@foss.st.com>
> > +
> > +description:
> > +  The Galaxy Core GC2145 is a high quality 2 Mega CMOS image sensor, for mobile
> 
> I'd drop "high quality" and add "pixel".

Ok, done in v4.

> 
> > +  phone camera applications and digital camera products. GC2145 incorporates a
> > +  1616V x 1232H active pixel array, on-chip 10-bit ADC, and image signal
> > +  processor. It is programmable through an I2C interface. Image data is sent
> > +  either through a parallel interface or through MIPI CSI-2.
> 
> Short note what the on-board ISP can do might be welcome here.

Ok, done in v4.

> 
> Best regards,
> 							Pavel
> -- 
> People of Russia, stop Putin before his war on Ukraine escalates.

Regards,
Alain



