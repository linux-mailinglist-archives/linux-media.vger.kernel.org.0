Return-Path: <linux-media+bounces-24127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626049FD1DB
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 09:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 491CD7A12E7
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19F31531C5;
	Fri, 27 Dec 2024 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2ikearV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A014B95A;
	Fri, 27 Dec 2024 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735287226; cv=none; b=Jo34uhxfs/tq0dtysfH9AyAqDnUAhUNmcBo2ECd8xP48ga3vCAGjb9goGQ2/sph+nAnMJfwHGoLNRZLppiI4fqFRfNmmgMJURK8kYPfLJdUbY0OjUvcoa30NYTaCxSW+aZRTO+QjG8eiucJ16DS+8QFV/CRUesuHJEnk9dbEnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735287226; c=relaxed/simple;
	bh=96Hwn3Z+nB6AngNQ+jC51nXEuFyFhKWFheg0DPO7DX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQUOiCiIFFHYMkK0WcJMhHEkiU7A2i0BFPqdhC5ahAhy5plMZQKMSFhyb9Kw7JfiZ6v4e8LHqHvnfcLL8YPI0i3WM8CrKRgFIyHIgMmVkyP5Y/lRc3n03UTNOs5KxBEO0yXy+7g/41USV0BziUFvMyS1SmWuXRkhpx335lqXoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2ikearV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE239C4CED0;
	Fri, 27 Dec 2024 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287225;
	bh=96Hwn3Z+nB6AngNQ+jC51nXEuFyFhKWFheg0DPO7DX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2ikearVIQGXVk7OUw6RZwnS3Un4zq4CnVNru13sDprPSxlmuJslono3QqU53AzIi
	 iPjyUJQTbTlmqcKxYccWA9sz59f6kTxUWr1U5scoZCYgdQnIC8oyOQ/kLxMIHbxdGe
	 Z2CYFJIys6HMhituaJUmBjsaqOj6CA43ciltrxZvFTzycx4SuJoAPSU/c+JiQ3h8da
	 w6ZteDNJLbKk49ijJuslQwdm9g3tA5U/kx1Kf4mMD1LFK1j6VS0wvUcySQh0Foi31K
	 XD9uAdac2+VkvcLqiqvXCp3mxgOlIRvo8xZm6MIyni7mnLC5eYO3opPXrgF/LxA+pi
	 u0WEtVsS19kIQ==
Date: Fri, 27 Dec 2024 09:13:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219170800.2957-2-jason-jh.lin@mediatek.com>

On Fri, Dec 20, 2024 at 01:07:54AM +0800, Jason-JH.Lin wrote:
>    2) GCE Subsys ID:
>    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
>    - Used in the Device Tree:
>    	`mediatek,gce-client-reg = <&gce SUBSYS_1c00XXXX 0x0000 0x1000>;`
>    - Parsed and used in the driver to configure subsys ID:
>      ```c
>      int cmdq_dev_get_client_reg(struct device *dev,
>      				 struct cmdq_client_reg *client_reg,
>      				 int idx)
>      {
>      	client_reg->subsys = (u8)spec.args[0];
>      	client_reg->offset = (u16)spec.args[1];
>      }
>      // GCE write the value to the register 0x1c000000 + 0x0000 + offset
>      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
>      		    client_reg->offset + offset, value);

This is a proof that SUBSYS_1300XXXX is not a binding. Your driver does
not use it.

Drop all such things which are not used by drivers or explain why they
are needed to be in the binding - what do they bind.

I asked for this already, for exactly the same thing.


I did not check the rest, so next time I will choose any other random
define and if I do not find it explained nor used, I will question it.
Because you tend to apply pieces of review instead of really change your
code.

>      ```

Best regards,
Krzysztof


