Return-Path: <linux-media+bounces-48684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A5CB7A7D
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F299B302B108
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D14B3B8D41;
	Fri, 12 Dec 2025 02:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/t+6B8P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D93347C7
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 02:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505929; cv=none; b=jF/gjWzX+SK6IgamA0b48g9DgIc+6OAkmB2MRMMqHigoqNFay1iZZfbn4pKWbY18q0eoOmU1v9QL36a6982KGx9Rk4vDFZHesOOj8UCNjllj24Pt89/XTNjgfIeeC20K+v7Dx3vPqii2krhKvqlT/7FJlSKwtVWzSpZ+MRLsryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505929; c=relaxed/simple;
	bh=vXY33GjJm5KPKMDDg0jEaAABT+hBR+cONrD6JmAwXDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEoMDXHOh0yBILynjW8QHtuYk3BLFnJC/Mprb/pHJnc6QnsqVjLCdorxZGXrwjIQNlOsT0rirKxorl8ZQGc2m8hIzyEoHdPVYrkkiSgljYKbyMKy9Ql4JzCcQLptbXcBcryN0ePuWSBGumw9jeNgnnsrg4KRbf6QIIGec3yeoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/t+6B8P; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8826b83e405so11052066d6.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 18:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505926; x=1766110726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rz/eTry6Y2wq/O9yk3kZ7L7qqerqYSKAZUQ7umqPc1U=;
        b=m/t+6B8PoS5vGcAgLl4O3pmOI5CWzflpjcQoFk/q6S11RymuyDRw+EdntE2nbhbu4N
         /Lf6YEjYt3Sp84RtkXJmIUa1aEGemALbdVtraDjB0cPkpiaHS1fytigjGoEamfBlsj+J
         4FxrzvuQEwKAZyqxr+CQDzhHR4/vnOStONHu/tolh7Zsjqyle/8sNpwRZGBuuyPz3oah
         NYdasxRQPddBCMrnJI8K1+PrPZHentUFaBpcDyw0EwpYPjVuFNMofZRYHPdu+e1KnKU5
         38uj0drAiLBmpWeAqd+DlQkBmCzxXSa0Z1ZD5KpvQWO42y0cm8ewQxAoQFC9p7/XQy6u
         pPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505926; x=1766110726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz/eTry6Y2wq/O9yk3kZ7L7qqerqYSKAZUQ7umqPc1U=;
        b=DVh0gimwxc8mJkAmSpFH/hYcvNAm80YPx4TZIe4JeKMVFFAMFFUpu6j8Au0k/hlGLe
         RiEk2BuBrE+vxp9JLeFSQnew7gMcvEqeALObGAAajuyFGI+ciOEQie6BsB+4Q2AflqzP
         8vIm+wcUn4OhPZ1zOtJpzFkLZqZ6FYOvRNTMs1cCaCmBR5/XIFzgJLSDXLfwB5guWQSj
         vCYrj/bW4wnUWndIvjrODBpWEF3zZ9ADdx5IJ0glXdCfuljgkuQpgz537AxMxqjfQBhV
         LEXSmlQ3GN9ixQZ+hoXhbdb3aYE2hv1eIQMQKZmIe+ME3PEBx5Zkw0slBj8gD+Ij/j/3
         vzcg==
X-Forwarded-Encrypted: i=1; AJvYcCUQtAptHx0x+hwyLQAbrAchgbcVAAALrK4WflBeIiF6eFF+GKKMXq7fpcGM1LhaHjzKxdelHBSZOITpeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6qP3a2AjvcpJClojyNTH8V0TzOcULUOhcU1Rxifxu7TL1trn
	G9SV0QFy5BBJMV6UJW1KMaAZXwW5gQEp7FkJeCNfdXQYiwfzU68Ttigl
X-Gm-Gg: AY/fxX5jIDUdi8F8ebG0ZkerwfCQ1mzlZ2wV/i8PsUxEMcJLu6LADnENbfBUP3YDKVS
	mV1anvN7zs2CqVTo3F2LvbAADXX1nqxCkKoBf8NVojmoTWLxgNv27U+1aS6d3Fm+E7K3ZWqzz4g
	75hacRx2MobTL0C9knb8i/4efAzkY96bzD3fQZMOdfs5PG5GoQzMbPPDNlxE0cJsli1zU6BxcMI
	DQHx9YeJvrOlnVZSDfREGw/h2Rw34eYwiwEnY6ENgf57Oz6ziZrmlpOy+Urbtw+FElbjCVZ7TnY
	LRju6u1g2YKH1JIarXQyU47mZZW0+b44vNTj6dU+Amz/ov7Tz5BksHmZb+jcxR9Hm5BwNZwLj5V
	DFZCMka93h6pqk3tx/dNm/+ZrMCkCvyTVKHhz9hTrLZCKzAJEc8EXHqN4EMDPDBUmAIkCmLOKLd
	GBOkeegfbh2J0m+g==
X-Google-Smtp-Source: AGHT+IGXWSQntm+9zo+FUUZWqvqyL6o/9gm+1bWRSev67+FCA2MGS0NQpQMbsyqXv/UrMCSeKZL2kg==
X-Received: by 2002:a05:6214:2b84:b0:880:51f0:5b93 with SMTP id 6a1803df08f44-8887e020d0fmr11582396d6.18.1765505926409;
        Thu, 11 Dec 2025 18:18:46 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88881a19c88sm778006d6.50.2025.12.11.18.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:18:45 -0800 (PST)
Date: Thu, 11 Dec 2025 21:19:00 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <aTt7lGXU5IPfANxq@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <2fff55c6-aea5-4019-bcb9-eaff3b44474e@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fff55c6-aea5-4019-bcb9-eaff3b44474e@nxsw.ie>

On Fri, Dec 12, 2025 at 01:45:52AM +0000, Bryan O'Donoghue wrote:
> On 12/12/2025 00:41, Richard Acayan wrote:
> >> This would be much better:
> >>
> >>    &camss_endpoint1: {
> >>        clock-lanes, data-lanes, remote-endpoint here
> >>    };
> > I'm not sure what you mean, there might be some typo.
> 
> At least for me the endpoint name could be improved see:
> 
> Take arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> 
> Also since you likely have more than one sensor I'd suggest endpoint@0

Uh... the front and rear camera here are on different CSI ports.

Something like:

	&camss {
		ports {
			port@0 {
				endpoint {
					... // rear camera endpoint goes here
				};
			};

			port@1 {
				endpoint {
					... // front camera endpoint goes here
				};
			};
		};
	};

Would they both be endpoint@0? Or would the front camera be endpoint@1?

