Return-Path: <linux-media+bounces-15012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD1930EFF
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 09:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5FE2813D6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 07:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252BE172BA6;
	Mon, 15 Jul 2024 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/mrYbau"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2926AF5;
	Mon, 15 Jul 2024 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721029387; cv=none; b=b1Pn2KX9J4x7DHP6v8QFi00Ek8DcExfFjMFU3BzTRH85L93jiiYfX46a5oCVt8doe2C39GdOBW8ei1B8QM9e3pI6NeEGEvV3zi2QAcum3aNxpyfBxGDuML6ydQiiVXFMR5GIApY1U7563ZXs3XchQPdfQxaDFaByUimT54o+YRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721029387; c=relaxed/simple;
	bh=HXPP361upzoSJxGqCN2TDn6x2KKVRGApcfg4NCZK+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QATjfEH4edoIbI3jDxZ+7WEvnOUAR+Es6VRfP5EIJkCqAZ0L54yxfBZ0N8PgEYXkKTsgTxe8WSum/tW1pzWdaH3KEa8SSV0YZhAjiBZNKKFKQpEs0cpaxApXO6Qg14e9zPKz5zamTeq7zrmgPGWPH6URrz/J/+hsF5UFf2ybqvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/mrYbau; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0397DC32782;
	Mon, 15 Jul 2024 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721029387;
	bh=HXPP361upzoSJxGqCN2TDn6x2KKVRGApcfg4NCZK+Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/mrYbau5rmqOp84l4FlZJNjHcg40VsjEe8S001kQ0pmvTOX44Y3Hyi18rqnjuKAF
	 e5VLtAzvY0IsZrs9AH3QskcYuyBwc45Ti6b9oxrtnwRjqVMEFsoWWCsDCuIsvkKNyW
	 G3K6vd4okL2Exj2IT2bpByNyOt6+jLt2SMSGtD1NcCKxS7q3cBL2FqfkmxfzPk/ad8
	 4uB99HBJex0tlBxlDjHk7C1j1yN6JJw+FwQu6y/xIckUoUsVag1kI5TZKDjwh9Po5q
	 md87KtZ3KLrRwiC1baKglON8OUb5w+Z4Pv0jhhRs+DCV5F0cvUIvUtMwWpacf4MMly
	 OTlw+h65x/Kiw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTGMR-000000001Qr-3PA8;
	Mon, 15 Jul 2024 09:43:03 +0200
Date: Mon, 15 Jul 2024 09:43:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hansverk@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Milen Mitkov <quic_mmitkov@quicinc.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Message-ID: <ZpTTB9Gv1B06K2p4@hovoldconsulting.com>
References: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
 <20240714-linux-next-24-07-13-camss-fixes-v1-1-8f8954bc8c85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714-linux-next-24-07-13-camss-fixes-v1-1-8f8954bc8c85@linaro.org>

On Sun, Jul 14, 2024 at 11:53:58PM +0100, Bryan O'Donoghue wrote:
> The use_count check was introduced so that multiple concurrent Raw Data
> Interfaces RDIs could be driven by different virtual channels VCs on the
> CSIPHY input driving the video pipeline.
> 
> This is an invalid use of use_count though as use_count pertains to the
> number of times a video entity has been opened by user-space not the number
> of active streams.
> 
> If use_count and stream-on count don't agree then stop_streaming() will
> break as is currently the case and has become apparent when using CAMSS
> with libcamera's released softisp 0.3.
> 
> The use of use_count like this is a bit hacky and right now breaks regular
> usage of CAMSS for a single stream case.

Please be a bit more specific about how this manifest itself to the
user. I see error message when stopping a stream (e.g. stopping qcam)
and the stream cannot be restarted (e.g. qcam fails with -EBUSY).

> One CAMSS specific way to handle multiple VCs on the same RDI might be:
> 
> - Reference count each pipeline enable for CSIPHY, CSID, VFE and RDIx.
> - The video buffers are already associated with msm_vfeN_rdiX so
>   release video buffers when told to do so by stop_streaming.
> - Only release the power-domains for the CSIPHY, CSID and VFE when
>   their internal refcounts drop.
> 
> Either way refusing to release video buffers based on use_count is
> erroneous and should be reverted. The silicon enabling code for selecting
> VCs is perfectly fine. Its a "known missing feature" that concurrent VCs
> won't work with CAMSS right now.
> 
> Initial testing with this code didn't show an error but, SoftISP and "real"
> usage with Google Hangouts breaks the upstream code pretty quickly, we need
> to do a partial revert and take another pass at VCs.

Please include the error messages that users see so that people can find
this patch, for example:

[ 1265.509831] WARNING: CPU: 5 PID: 919 at drivers/media/common/videobuf2/videobuf2-core.c:2183 __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
...
[ 1265.510630] Call trace:
[ 1265.510636]  __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
[ 1265.510648]  vb2_core_streamoff+0x24/0xcc [videobuf2_common]
[ 1265.510660]  vb2_ioctl_streamoff+0x5c/0xa8 [videobuf2_v4l2]
[ 1265.510673]  v4l_streamoff+0x24/0x30 [videodev]
[ 1265.510707]  __video_do_ioctl+0x190/0x3f4 [videodev]
[ 1265.510732]  video_usercopy+0x304/0x8c4 [videodev]
[ 1265.510757]  video_ioctl2+0x18/0x34 [videodev]
[ 1265.510782]  v4l2_ioctl+0x40/0x60 [videodev]
...
[ 1265.510944] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
[ 1265.511175] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
[ 1265.511398] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active state
 
> This commit partially reverts commit 89013969e232 ("media: camss: sm8250:
> Pipeline starting and stopping for multiple virtual channels")
> 
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")

Looks like you're missing a CC stable tag here?

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

