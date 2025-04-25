Return-Path: <linux-media+bounces-31072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38AA9CD01
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 17:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79D514E1C0E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 15:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D592288CA1;
	Fri, 25 Apr 2025 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIY7oGRd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987828A1CF
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595020; cv=none; b=BGtqrnPZHj8iRKNQGz3shqt3v0FQGCa6VSeo6FevJsAz6g+4eXBnULGNJK8MC7KF/ONqnHwKf6/BB8YXlsMmVRvH5LNiuohUtRsciZoGuF/DtLbNZXODR7gRQRPqhIzCxrYaCnv4S7FDkrrsTBQFcBiIbPN9rCc4oKAEKnT+wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595020; c=relaxed/simple;
	bh=ahFIwcIRMsxGsYw7Ro1znBHhQb9IRWhbo25rb6BKN1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7mYoUyAIbRLIHgIHOn7HL/nfbMWeQkBdN6T/v2l9DkD0QAUivVAR4xEvhsK3EyYKPCM+lbWPlmKeHedIYjstKBsJuwFVtU3acLB/eSGx9t6Q9I+HCl2JfX61ZfzofP+MQEsC0qarlKAzQycCBi9I3azwMkFUDjigKHLSR+yZ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIY7oGRd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1483996f8f.2
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595014; x=1746199814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
        b=vIY7oGRd8jYvnGLP4tQWZxxx6C8AFthUwW6eEVVbdrkJLWUf1be9CY84oNfaJ1Ynwt
         OUoth6j+G8ubGm8ByBCLEEfbsyXOA6cbPDZn0DAnRtXkPENRnVTcEfrl7+Fps/gdzad7
         xwZQnnLEbhGFn03LsCYZNpEkZPynC8+30FV4Kw6oOyrAa+h62XHI2+UKncKY21yZeZj3
         JEaF8XG6RKy0hAnrNhi6chSpxfBlx8uB+UGJoAGcVad4AS+53VlNDGjFfv/07B0zmBkj
         vlBTOW4vs5zETlF/4dDAqXMRACkfjMtD3af4nrzBZH/m1fUcCn8bpATx7RXfysVecQFf
         KM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595014; x=1746199814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
        b=Vt/2CnTLhSvSyLUsKLWzhxG8sWRAs03e0IQwYhYN2rGq3MJ2Ukgmzp8GThL0e8icST
         KdcxRERy1BLdLDRTgIKP2/OjRmgsHmJqD4MUFzUbf/4yp5XpQC006r5Ot6+BST8K0MMH
         6WINiBeeRlNCm/cr1+Tgp3uo+abpo9hV5g4nqPfnLhMhzySCgQv3++ut10cc10oCwRg2
         SlAdRkh/cpHHNqyOkkGGLGWCzTey3B5MwG2fig8C1uzyR8OKm4dTFp+dWbDB89PVl+D5
         Aq9gO+8n/0mWrNLlvm4sfr+w3kMDisiyVv6eWpZAydw9V1mm1UXcRgWIjVd1e86OgrmQ
         JCcA==
X-Forwarded-Encrypted: i=1; AJvYcCUGyxRWBRoVSRRtRFvCHXjccnJjfBCDqQiYnPXP9S7/xO+gQugDp/QEu/214rpuigiHtQ34lPWrmOieKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOq4jLXCqH8nnj7QBNLpK/e7QCnIjmI0B3wBvGwELuBGOKOLp9
	DVAkFLS9HWCgvbW8zhAu79ZGDTlh8y4Gm+p2MSE5dLeOmHAAF45oYwd8ISzLIng=
X-Gm-Gg: ASbGncslHOkHwxyzlpXGx3xVqs/JX4DPhDrdF/755jRXHvcDdfcRZ9yQQuYvFmO57jC
	rJCxl0XvIhXYn6PGHWqk0Ekz2rgGD23ciwn0fbxSFUA7GRCDl/uEJU1SD4PoIYTb2VbId/5Z8Al
	vxhGoIdGjBA78+cZgYQXUsgh5IJBRx84ycvz5VusNbhi/tpLv6lJhzoP26x1wfWrZ94tuKfktPl
	vpOlQTyXYvPzcX4HbGLPu4jGV5PbhYmYQ7+HHF6mUQ7U9PoZooKM0mb8f+P8jv5Q1Oe1Qz8hfjS
	ICpPYnEaC+BZH12d/GIILcmCAbPfKGcWYTKsbd4eoLdaAn9cU6Mmrpwb
X-Google-Smtp-Source: AGHT+IGyQoffBkkjn9GdlBOynB35D8e4ETPc01tgM75yAlc1oqBxq4rXGz8GsC/XanHp8nvcBgQZNw==
X-Received: by 2002:a5d:6489:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-3a074e0e059mr2152557f8f.2.1745595014541;
        Fri, 25 Apr 2025 08:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e6daa0sm2592945f8f.101.2025.04.25.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:30:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 18:30:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
	saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, taras.chornyi@plvision.eu,
	edumazet@google.com, pabeni@redhat.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <aAuqgiSxrh24-L-D@stanley.mountain>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>

Whatever happened with this thread from Feb.
https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/

The issue was that people weren't expecting of_find_node_by_name() to
drop the reference on the of_node.  The patchset introduced a wrapper
which basically worked as expected except no liked the naming.  Krzysztof
suggested that maybe the callers should be using of_get_child_by_name()
instead.

I created a Smatch warning for this and here are the four issues it
found.  The line numbers are from linux-next.

drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

regards,
dan carpenter


