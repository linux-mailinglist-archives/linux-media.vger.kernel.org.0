Return-Path: <linux-media+bounces-18436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA197E342
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2024 22:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86CE41C20CE7
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2024 20:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D235B5D6;
	Sun, 22 Sep 2024 20:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8nnl1TY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9C2AEFC;
	Sun, 22 Sep 2024 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037193; cv=none; b=F2lT/Q6hhYJKjMQdajU6A+YMlKKxc0VQ8lT0hKDFVm2W1x5yBixUOO82+lHVbrnuI+EpQwzjkUp6EYkGM9RlqZHXwG9J/RYZqtqsFdQqhWaxNX3cJ7lEDawZEIWTegrhwq3u/mTF2OS/2ujBVxbpBM4wlOyJDOGwzQxo9d4SUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037193; c=relaxed/simple;
	bh=kQgm3SZGxW+gvFOufHSVT4h1ipvIYBkI2AYeB6f+NW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAh1Xdw8XY/Y+DnyvdX/cHQ7E/4r6MljR8qHutkmD4uBZbHQF0eWMPiyZUTYATi050v/kbjuRt0agrd1V+okIFLPTopkpBLKUXI36ohep1r17EpNyLe2TJLua8xHhOoSNKdIok20t5LGuaPF/vTjNdICRe9v54Uw24MwchGfouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8nnl1TY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5BAC4CEC4;
	Sun, 22 Sep 2024 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037193;
	bh=kQgm3SZGxW+gvFOufHSVT4h1ipvIYBkI2AYeB6f+NW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8nnl1TYczuFzs7OUpbOUX77WRhBHEaYd61DyEXSuzoQJ94NW6pXWJ410gB3wryFP
	 60K/2/hpjOS0aHHjt/r0PbJUOf+iHyDTr5naM95n7oF8gl4iwrhSUkZ69PBZP9XG/H
	 wcm0cUEVGZ2iRB8MLOi9GE+aM3LtUhknj0jB1GOqgdaAvryYyZiDC+/kY3f5RRxsrl
	 Wq9IdDJxVBIVQ/GeiihTQdAtesYasAP48yfkBhQpNxnfnjFjjQle+XqFMtpeXznpzk
	 zu7/RlEpKvjZ8s5Y8yhz3Kzwtuo6mjJL7m/gZj3j4L009g+rw3aIMPx5T7PU50wEsR
	 Ft+HfQ6hoi46w==
Date: Sun, 22 Sep 2024 22:33:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <n3u4licmep32gs23lucnelczhinhri3arsu4j6p3yf66j63oaq@3zoazav65x4j>
References: <20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com>
 <20240920-loongson1-nand-v9-1-9cc7b9345a03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920-loongson1-nand-v9-1-9cc7b9345a03@gmail.com>

On Fri, Sep 20, 2024 at 07:18:53PM +0800, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 NAND controller.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v9:
> - Change the compatible to 'loongson,ls1*-nand-controller'.
> - Rename the file to loongson,ls1b-nand-controller.yaml
> - Some minor adjustments.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


