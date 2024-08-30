Return-Path: <linux-media+bounces-17219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08354965A84
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 10:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A41B1C21DAF
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA07416EBE0;
	Fri, 30 Aug 2024 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="vq/3HPO1"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1187A16DEC3;
	Fri, 30 Aug 2024 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007036; cv=pass; b=baaW+5vIBkwBmKOecoiv2Zif/HdhDxPwbs6szKPpf8V+7uXLmWgthK3NcBcRNuW/m3sf41bPX816WPpIvtzkXXNbprskkDhlvITl8F/rl/fPsy7HrrcPkAVR/cs0O5ahKROC5g7Z+JZy19s23UGc/wc/Obyzak5HKifzoAc6aHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007036; c=relaxed/simple;
	bh=a88l2OFkVPVZBi4/ldb1Su8ggaI7yUcJuphA6JUCSn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCj9SMcBOGJOE8VJVlRVZqpAlaFO11Dr876CuL/XQErYk/ws5Ktkj4T6ZAjkk9cBIkmVTXRxO8VWjQOtJR91sbrfmGpLOW8jGpijpbwhawr7yMytPa7TyfFRLCPfRVwWCdEkM5jwR5Z7of/gq5DPWADIm3RqwGNW7eHcv5e7sRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=vq/3HPO1; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WwBMz6fTjz49Pyv;
	Fri, 30 Aug 2024 11:37:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1725007024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6gSAcbLAZ0ntmnu/ahnUfNwVSXfe2WX186neV+qH/Y=;
	b=vq/3HPO1mT6vF1O8Wh7XxcdSpsZVJ3ChwPI/3bs5mBmcZ1EkrGeoExCdXErJhhyqmz7PrH
	HQ3bUCv44VNUCnTtpFtTkd29XVMz3oY9qEjcQY18YItDu6QCdZQSjNne/8iu04vS5qGhSL
	1V/YjODBwGB/AU8PgWrRRCIf9UEp+vOLRpUAQa0dpAZ1Q7YxSGl6hs6CEgak23nL2Ds+Lc
	9ePpEtqVKYElVuoYlJ9OZ1OzTA8A+NHa3rnYQJMZwbp2RQY4MQMp5pTx60wEdRvuQGYE1L
	bZ0bmgngAP4hQvjM9CQUHEZldvqG17huloEQ2rwX5axTpkcTnv1bBLwVYPki5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1725007024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6gSAcbLAZ0ntmnu/ahnUfNwVSXfe2WX186neV+qH/Y=;
	b=Q+SV2LaXyGXjfMD42YYS8yLLhGrmuwkO6ylM4VIy9wR3d7VVPWLf/5b2zhNnpS2JKDTh6U
	F0zlAEKBW5KMLoQPeuVWwHFPu7z1xx8mL6Vapr/X3zMHvqOO4QmLHQ5sN7T0uhkEdl9JGk
	Ov9y8aJqAeQjvG9mfGLGxOBm+b0XNvrNzOJPzJaATrhGC/n92xr0MgeST8+LlaAk6dyBe/
	pK3R1lW6XCkR5Oyr6VgTftmbl2OUFYWCec0cSDB1ntqQqklZ1//UFDJ/rJytaEp7J4M0Qi
	Rf7nUUXG0oUJYQU1RtfjRHH1EgrukckVDMJS1Y21clZvtl5VS2xObn0q0MqQBg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1725007024; a=rsa-sha256;
	cv=none;
	b=MRG7OHYGur1TsrrazNEQ9Q6V4wr01cxnMNLWl9JRRrlOZ9rbCGtYSqKX7boXQ7kgwdWu+E
	z1JftqiZfL/NmWrR/ik8+7kvoMGHrzodQRfbBkH13lfj/MzazAZ0JUpHAqlUmpoGOosUCa
	F8Ye16lZbvFgNOL1PydbjJfPlMmRDJNiRNBFB7PsDzBi7LrBxNAKvnoUl0hjeQWeCF2/Gr
	7CUzxCfeRc0gYh3V3EaLMnzboKHE1f2x9QoTfPCQQiq0x/sMvImlTH00ntunbyHe9gb96L
	DCM5CuS1/QhD5F1oqMA4euqSn26ZgUV+YD+StxYy5ODZKGk8ymwnHWUJw0ZPuw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 24B33634C93;
	Fri, 30 Aug 2024 11:37:03 +0300 (EEST)
Date: Fri, 30 Aug 2024 08:37:02 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v1] MAINTAINERS: Add "qcom," substring for Qualcomm Camera
 Subsystem
Message-ID: <ZtGEro9qidyoh3-w@valkosipuli.retiisi.eu>
References: <20240820112053.560605-1-changhuang.liang@starfivetech.com>
 <9172f40f-c886-4fe4-bf12-d6d066522921@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9172f40f-c886-4fe4-bf12-d6d066522921@linaro.org>

On Tue, Aug 20, 2024 at 02:08:28PM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2024 13:20, Changhuang Liang wrote:
> > Commit f5502cd25ac0 ("media: dt-bindings: Add JH7110 Camera Subsystem")
> > adds the StarFive Camera Subsystem parts, also complies with Qualcomm's
> > rules. Add "qcom," substring restrcting this condition.
> > 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> You miss "media:" subject prefix, so folks will notice this patch.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks. (I added media: prefix while applying it.)

-- 
Sakari Ailus

