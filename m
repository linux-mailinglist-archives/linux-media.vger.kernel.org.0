Return-Path: <linux-media+bounces-21924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 605D19D7B95
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 07:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B75282280
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1FD17BB0D;
	Mon, 25 Nov 2024 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpQNulJ3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522402500DE;
	Mon, 25 Nov 2024 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732516671; cv=none; b=cZA/kWJ0G/uViB5/hwsx8JhBIZRW6/G7GmlNvOpPXYRK3xR98W8kqwP4cw0ghQUBohNUxnQUTw37vPsFw6ex254TDNMmrDpooCHHqLu6pEUCHcJNDlLt5DINEgfza8gnjutewAiA7edFjS4Vn8Sq0YcQH3DxwnFcYwrXpTLZ6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732516671; c=relaxed/simple;
	bh=08bC0RAtHardKamxtC9AyO39XuQBUs7ggBLZAPM8xl0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=coliwmJZzWYMVG8SVd/iQd9krB5EYP5xpLcZxySUxuyL+mLlZxCQLWzHSkNjTyag2KD6tqvJevUyXzeAV9TXWPXlcSoyf7iE91/Qcngm1u/jWA9l82uyUIh3R0DoOA0V0KXc8yBC/PS618jriv1uR0c7SedgUyWNxJiS2Ue0F5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpQNulJ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBE8C4CECE;
	Mon, 25 Nov 2024 06:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732516670;
	bh=08bC0RAtHardKamxtC9AyO39XuQBUs7ggBLZAPM8xl0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jpQNulJ3HO8gt7YHFLrw3NxTnfI0JgeurtgCQio9GADt+ahJnDy6o6xZS9hn8QpHF
	 chU4VH57RuPDc/38PCkdwpaOfgvsVg9UxDVcJo8JSUxYtiGTk5cRHiVD6o/3TpC7oP
	 S+yYs+7oqZpeoo/u1wEiztFTNE7QRCl9/FvswSTbOVNHHiKWi614uvhcuWBmxIQYbt
	 XgRsQImbemtiB6T+iw9ItTZgMlMTsKOlOMuxp8JzpjEDHBoe9WG0DTxU1Nu2oNGc1T
	 hNCJSaMpG/UmLm8L7RI8WkB8Y40wD2bQFSHODULfYubEB0OW01HOpJrxaTidc1dDnm
	 KAHfDG27aAv2w==
Date: Mon, 25 Nov 2024 00:37:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
Message-Id: <173251666879.249116.13599300666564865920.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware


On Mon, 25 Nov 2024 11:04:49 +0530, Renjiang Han wrote:
> Add support for Qualcomm video acceleration hardware used for video
> stream decoding and encoding on QCOM QCS615.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,qcs615-venus.example.dts:25:18: fatal error: dt-bindings/clock/qcom,qcs615-videocc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,qcs615-videocc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/media/qcom,qcs615-venus.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


