Return-Path: <linux-media+bounces-37097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2570AFC8C6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48ABC1BC55B3
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C261829A9D2;
	Tue,  8 Jul 2025 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tu1gnYuh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31726D4C6
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971591; cv=none; b=UrFW4zc9zR5s3OX002Rxv5ooIBiDiPYr14n3OUc1k/9CbhrXG4n2XApZRxEerSZZl+OFTwmjsqRbAbF9lN2+jMd2cHf10DuapswhRLGMwWRzySccJeUOtHsgIU55WGYxHdrB3kxjVz8G+Rs7O0gvPiQOMgcD7IPYlkhM19UAuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971591; c=relaxed/simple;
	bh=/fcNgtiNSfzQMIkp2tlkcpV2p/oF9ZjZmVUyeME1d8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cllE9L6Ltq2FfGatGQfdhAa8/EuN6XaaTjn2YtqIwRxWBNnotrENeurUPyqkG6mQKvPni1btIBjPFiocjPsSL7fyN4wjVLsufxrbWLJGRQTbl+JsoWE6ttpT7dADzTf/o+Gy8Pfh661esBt/fSdCkvezh3UbyRjMoCenWBzUDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tu1gnYuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8844EC4CEED;
	Tue,  8 Jul 2025 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751971590;
	bh=/fcNgtiNSfzQMIkp2tlkcpV2p/oF9ZjZmVUyeME1d8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=tu1gnYuhBIGHHVIm8Os/GuNe9vh03AU21fpAlgyn0lvykkbss6bhlF+1CHqxp+M9Y
	 q4N/0dRPYdWPnmOTqv61jPNYI2c73B7qnWGOviy7wnfNTKgBhiFumpd1QpiXHKu0ta
	 T2x47NY/T6B6nZ3IEQnbXs2Sm8NY9tcXHFFFIKqdI7M6rXZyWsBptgb80JYlBu8qZC
	 a3Pq6XiDIXZ9n6B4nxCqvZJZAShj87n72jtPJtys3794zcDR8ZKJUiIt0PyB/62+gO
	 YtzK+GrtHYieaqy739QQxPIW0onfHAuLMesuDMVlC1JF3sbSByENT/sl0x7AwKloK9
	 CVJzCLiPw0dGg==
From: Hans de Goede <hansg@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/1] media: uvcvideo: Use a count variable for meta_formats
Date: Tue,  8 Jul 2025 12:46:21 +0200
Message-ID: <20250708104622.73237-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I still was not entirely happy with how the meta_formats handling code
looked, especially not with uvc_meta_v4l2_enum_formats().

So here is a small patch / attempt to clean it up a bit.

Ricardo, assuming you're ok with the suggested changes can you give
this a test please ?

My main UVC test cam only supports standard UVC metadata which is
not helpful for testing (1), I did give this patch a spin with that
camera but that does not say much.

Regards,

Hans

1) It is a microsoft HD camera (but quite old) so I wonder if maybe
it does have the metadata but not the extended control for enabling it.
How would I test this ? 


Hans de Goede (1):
  media: uvcvideo: Use a count variable for meta_formats instead of 0
    terminating

 drivers/media/usb/uvc/uvc_metadata.c | 21 +++++++++------------
 drivers/media/usb/uvc/uvcvideo.h     |  4 ++--
 2 files changed, 11 insertions(+), 14 deletions(-)

-- 
2.49.0


