Return-Path: <linux-media+bounces-48944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66222CC5B73
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 02:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7CAA300F319
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 01:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C114257851;
	Wed, 17 Dec 2025 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzx3BBPs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C25230BD9
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 01:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765935691; cv=none; b=cZ/03pSd7IqQc/ujA5bG1wK0NZY4/Sunr1I5sUbxhjyvDN/l6+C8sWOq5YMSnvcSBwhLnQYuI6hDWus3SPPHk3TYDV7R6LrBNIECw5TUOks1eH7IWW2w9zh+sd9Kv+N9IuZAETb9RGcPUXJTNOPCs6oVP5Q0PrNEyjyiIwAfIwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765935691; c=relaxed/simple;
	bh=2/zw0Nqll5k0O24hyg2cPPxtuqyfOWLeA94KYYj4AnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1dueVizV7H9NmfjUs7p5vGzmH8l7iOQ55yZa7t+ZgDx7kTM+3ncDaovI0yb2U+jpBa0+sRHy9s9VVWs3OwBR6ourkdzgm61Cn+0ddw+6OzNGpcA+Gy4YcOsKGbQfILOJL8xSodF66GU+8SpyqIrCPtgxKw/ym2OvFBZrUoyhsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzx3BBPs; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2d32b9777so773501185a.2
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 17:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765935689; x=1766540489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZcO4USqsNQIN1GpP+KDtX+lrVNXqODY1Yk6T5TPE2sc=;
        b=Zzx3BBPsghCIk9/UIRi/Mrvpxk6o3bICTu6zoRzeOU6na3GNMz4pSvFBa6KJTShEQx
         bq7wgUqSb+zT7RIvcYlnH9C5dSkWo5V7jgFxv09dEUlm4RqW1NzIYA0UkTs9xTr0qE62
         BusGWWvhONN6rJncqxfGy1SBYY8MH05YfbPKZE373GaFVprS6+A44QyQ29Sv/Tfn3m6o
         qJ1B/TLyxbxkJ3JxZ1NoOaTlmTWVo1PBDEp2QALRlWSCWErrOiU8bU0YYvF+1cUlv5yJ
         OcgLEafjs46023PTZbvK8VJu9W2jfroTBa5rRJej3GqL4K1+AysL18kdP2ifBKRfT1sR
         HZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765935689; x=1766540489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcO4USqsNQIN1GpP+KDtX+lrVNXqODY1Yk6T5TPE2sc=;
        b=ZK0lZGRVtbj6uKntaMLtfF8zRGiS9m3LlvjqUokP8IoaL6ouimA+/2VgE6f68/s36j
         YBXbl07RQVvYuaEGa78Mqe+zQqo0QuBUZ8dpmf22O4/lHp1E91pkCaBfwuvcSOyw9IO2
         y4NHioY1v2RwQDcDyYEDsI6J1225QQWuhyt2jh0wmV0DIV+ELidinl8vJMv42390yufc
         lfGNmaNJ38j+DAGHrsRhIAxVCnk248GR8OzPw9dpCKu6oxtkseu13XgsBf8dhtb+f82P
         Rx3lel010HyJaBXfCek6ju8ZMHna3u/JchfCr0CqqM1mu19MF6OQShiRdacSP/2oLp6h
         Cffw==
X-Forwarded-Encrypted: i=1; AJvYcCX8z4XEoLkPh9K0ToiPspaLS60dxC04mjuncGyMIKuFmZpBrAh/ZnLbJ/OyqEHPB+U3S6B1ftbBQSZz3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32N/XRnKcVB813ve7ORaCm3ur5uLfMkeZfLfxCfkGRuaqk0gC
	2b7Hr366fzuDZSpukmUWxq8e6iG0r6esg0YJxJwwgTlMeUNx4MQSVPdx
X-Gm-Gg: AY/fxX5WjrV5lRTy6T4im21yMlBLqCumszsVTvqqoPcfdBkIcoCbVnC59XCmC2Ig3R7
	OsD6FOXWR3czLYPT9kkMZ1nEWI0nuAgbiTY/+aliB/oL3bZUYCXUV7+lWmQFklrBf1fnS364DTZ
	Wmx6FyJytZzD0ksaGvYNhwk2iyMBlQhslAw8l0dkudeY2f+J2WpvKV1YiJfzOIWSfOdjG6aAmKw
	/2huVAcnO44Hzi+Ye2YmFuM/DSiSe+pLOMHAndhNmz0PC0CHYbAh/cOv93UIQUARi48W/T+NTgl
	+xSQf9X2iYOJWZQo9N23HFoYHpI9r0sy9N2Kr0Gd8oY1I2bTSUrSO5ayzSf3CBS34SxIjlVxrcT
	PRKTjgk4ZQOrRCbXHZT0zCfZzJ7KPYgCkS8kqsEVk2YJClIC3bdu4/ZfSYSawFdEYQthCTjxPlP
	9Fp5jeQaNZWPZ+sgpMSZhpk+FK
X-Google-Smtp-Source: AGHT+IGD1+xr9e42ytKFlInllPLK8W19NJ5qwHqCkO38bsDi/F1/I+STZYAPgoo7L7NASYoo+8u9ZQ==
X-Received: by 2002:a05:620a:370f:b0:8b2:dd7b:cc98 with SMTP id af79cd13be357-8bb3a37b12cmr2300528885a.70.1765935688985;
        Tue, 16 Dec 2025 17:41:28 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b669d1sm298209985a.46.2025.12.16.17.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 17:41:28 -0800 (PST)
Date: Tue, 16 Dec 2025 20:41:44 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <aUIKWMQMAIzjybHO@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
 <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
 <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
 <4c4e8e5b-66b1-4227-86ee-756eca945972@oss.qualcomm.com>
 <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org>

On Tue, Dec 16, 2025 at 05:23:53PM +0200, Vladimir Zapolskiy wrote:
> On 12/16/25 16:41, Konrad Dybcio wrote:
> > On 12/16/25 3:31 PM, Vladimir Zapolskiy wrote:
> > > On 12/16/25 15:56, Konrad Dybcio wrote:
> > > > On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
> > > > > On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
> > > > > > On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
> > > > > > > > The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> > > > > > > > mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> > > > > > > > support for it.
> > > > > > > > 
> > > > > > > > Co-developed-by: Robert Mader <robert.mader@collabora.com>
> > > > > > > > Signed-off-by: Robert Mader <robert.mader@collabora.com>
> > > > > > > > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > > > > > > > ---
> > > > > > > >    .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
> > > > > > > >    1 file changed, 107 insertions(+)
> > > > > > > > 
> > > > > > > > @@ -392,6 +420,64 @@ vreg_bob: bob {
> > > > > > > >        };
> > > > > > > >    };
> > > > > > > >    +&camss {
> > > > > > > > +    vdda-phy-supply = <&vreg_l1a_1p225>;
> > > > > > > > +    vdda-pll-supply = <&vreg_s6a_0p87>;
> > > > > > > > +
> > > > > > > > +    status = "okay";
> > > > > > > > +
> > > > > > > > +    ports {
> > > > > > > > +        port@1 {
> > > > > > > > +            camss_endpoint1: endpoint {
> > > > > > > > +                clock-lanes = <7>;
> > > > > > > > +                data-lanes = <0 1 2 3>;
> > > > > > > > +                remote-endpoint = <&cam_front_endpoint>;
> > > > > > > > +            };
> > > > > > > > +        };
> > > > > > > > +    };
> > > > > > > 
> > > > > > > This would be much better:
> > > > > > > 
> > > > > > >     &camss_endpoint1: {
> > > > > > >         clock-lanes, data-lanes, remote-endpoint here
> > > > > > >     };
> > > > > > 
> > > > > > I'm not sure what you mean, there might be some typo.
> > > > > 
> > > > > My point is that you are duplicating `ports { port@1 {.... }; };` from
> > > > > the base DTSI here.  We usually try to avoid this kind of path
> > > > > duplication. If you can't have an empty endpoint in the base DTSI, I
> > > > > suggest adding necessary labels to port@N nodes and then extending those
> > > > > nodes in the board DTSI.
> > > > > 
> > > > > > If this is about using the commonly-defined endpoints, Vladimir broke it
> > > > > > in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
> > > > > > unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
> > > > > > afraid this could break a second time before even making it to
> > > > > > linux-next.
> > > > 
> > > > Quite frankly I don't think that commit was valid, given it's conceivable
> > > > that an endpoint could be unconnected..
> > > > 
> > > 
> > > Endpoint is not a device, status property is the property of devices and
> > > not a property of anything else as the Devicetree Specification v0.4 and
> > > earlier ones define. Dangling endpoints are fine, there is no need to
> > > add another property to determine, if an endpoint is connected or not.
> > > 
> > > There should be no status properties inside endpoint device tree nodes.
> > 
> > The spec doesn't actually define what a "device" is. Funnily enough, it refers
> > to "endpoint" as a device:
> > 
> > 2.2.2 Generic Names Recommendation
> > The name of a node should be somewhat generic, reflecting the function of the
> > _device_ and not its precise programming model. If appropriate, the name should
> > be one of the following choices:
> > 
> > [...]
> > 
> > * endpoint
> > 
> > 
> > Plus an OF node is opaque in its purpose.. The top node, a firmware node, a
> > node representing a physical IP block and a config.ini-style blurb are all
> > "device nodes"
> 
> It sounds like somebody of DT maintainers should clarify the matter and update
> the spec to be less ambiguous, if it happens that "device" term is undefined.
> 
> > 
> > But coming back to the real world, the ports/endpoints represent the physical
> > connections to CAMSS and it makes sense to have them defined in one place,
> > especially since there's a predictable number of them that should not be left
> > up to each board to define.. That quite obviously implies that not all boards
> > are going to utilize all interfaces and the commit of yours that was mentioned
> > above seems to only be valid on the basis of semantics, which I above mentioned
> > are not *really* a valid point..
> 
> For whatever reason CAMSS on SDM670 is very special, because IIRC there is no
> other platform with preset status poperties of endpoints. This exclusive SDM670
> specifics shall be analysed and eliminated, since it hasn't been done during
> patch review time, it's time to do it right now then.

An SoC-common endpoint node is how panels are hooked up to DSI. This
seems to be the case for SDM670, SDM845, SM8[123456]50, etc.
It's not special or unpopular for DSI, but CAMSS seems to be the
subsystem where an endpoint node pre-defined by the SoC is only in
SDM670.

At least from the context retained in this reply and my memory, the most
compelling argument I've seen from you so far about removing the
pre-defined endpoints is (in multiple steps):

	1. Suggesting common endpoint nodes instead of common port nodes
	https://lore.kernel.org/all/e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org/

	2. Breaking common endpoint nodes in CAMSS
	https://lore.kernel.org/all/20250903002255.346026-4-vladimir.zapolskiy@linaro.org/

This is why I try to remove the common endpoint nodes now.

