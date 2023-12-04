Return-Path: <linux-media+bounces-1595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682580357E
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40FDC1F21074
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1E825575;
	Mon,  4 Dec 2023 13:52:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0635EFD
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 05:52:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rA9NB-0001MR-FQ; Mon, 04 Dec 2023 14:52:33 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rA9NA-00DX4I-Py; Mon, 04 Dec 2023 14:52:32 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rA9NA-000HGj-2K;
	Mon, 04 Dec 2023 14:52:32 +0100
Message-ID: <fc0baa11373888c3dc09e76fbbbb6d382028d738.camel@pengutronix.de>
Subject: Re: [PATCH v2 30/36] media: imx: Fix misuse of min_buffers_needed
 field
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
  mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com, 
 matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, kernel@collabora.com, Steve Longerbeam
 <slongerbeam@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Date: Mon, 04 Dec 2023 14:52:32 +0100
In-Reply-To: <20231204132323.22811-31-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
	 <20231204132323.22811-31-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Benjamin,

On Mo, 2023-12-04 at 14:23 +0100, Benjamin Gaignard wrote:
> 'min_buffers_needed' is suppose to be used to indicate the number
> of buffers needed by DMA engine to start streaming.
> imx-media-capture driver doesn't use DMA engine and just want to specify
> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.

This is used by imx-media-csi and imx-ic-prpencvf. Both expect two
buffers to setup the IDMAC DMA engine double buffer (see
csi_idmac_setup_vb2_buf()/prp_setup_vb2_buf()).

These functions can cope with less than two buffers queued, by using a
special "underrun" buffer as a workaround, but the hardware does
require two buffer addresses, so I'm not sure whether this really
should be called a misuse of min_buffers_needed.

regards
Philipp

