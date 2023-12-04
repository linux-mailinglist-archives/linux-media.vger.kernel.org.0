Return-Path: <linux-media+bounces-1594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581280353F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FED51C20A87
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BA42555C;
	Mon,  4 Dec 2023 13:45:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E40D8
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 05:45:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rA9G0-0008CM-0H; Mon, 04 Dec 2023 14:45:08 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rA9Fy-00DX3R-42; Mon, 04 Dec 2023 14:45:06 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rA9Fy-000H8w-04;
	Mon, 04 Dec 2023 14:45:06 +0100
Message-ID: <82a42b2478c36a27bd56660f8d4b4da40b9fd897.camel@pengutronix.de>
Subject: Re: [PATCH v2 02/36] media: chips-media: coda: Remove useless
 setting of min_buffers_needed
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
  mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com, 
 matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel@collabora.com
Date: Mon, 04 Dec 2023 14:45:05 +0100
In-Reply-To: <20231204132323.22811-3-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
	 <20231204132323.22811-3-benjamin.gaignard@collabora.com>
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

On Mo, 2023-12-04 at 14:22 +0100, Benjamin Gaignard wrote:
> This driver uses min_buffers_needed which vb2 uses to ensure
> start_streaming is called when at least 'min_buffers_needed'
> buffers are queued. However, this driver doesn't need this,
> it can stream fine without any buffers queued.
> Just drop this unnecessary restriction.

Did you test this? I think there currently is some initialization in
start_streaming() that doesn't quite work when starting without any
buffers queued (it returns -EINVAL if called with count < 1).
For example, the CODA960 decoder initialization expects 512 bytes of
bitstream payload to run SEQ_INIT, and for JPEG decoding it tries to
determine chroma subsampling from the JPEG header.

regards
Philipp

