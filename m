Return-Path: <linux-media+bounces-11509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA28C7251
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D621A282CE3
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8DB6BFA7;
	Thu, 16 May 2024 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fR9nUFVu"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0573E49E;
	Thu, 16 May 2024 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715846307; cv=none; b=BdBosSMnayZsp/Mxnz1T/6T5mZtcATrfovwyacQ9GGWyR/LMpl8i0/CXz4tL+M4RmQm30nNVxCArK4+I5EL1UdaZuPN2aB2GvlyrvkGL6bZKbYGYsemekVR7lLeZ4EPaJ+S+lMg1sPqyAnceu9VaOfx8WQXcDHADUbXIN0RLkug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715846307; c=relaxed/simple;
	bh=YNnO+YHP/FnlxQ5PatkNjQ9Nib8ubYkKUzGgdEIYd8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMpMxu9W5TpW4rVB0qs7LqCQncocsrQlE6G1LHW7OE1/xi7yWaXKziRF6MLYudwH5e0yav1cSG1xxwI41po1RqiK+3RgFHhbMo0kWwlfqHCo+Ck32tmclISXS4A4dXgu8OBvACNwJWCYwIU2vPzaemnipmyeiXf+/dJFuTuFWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fR9nUFVu; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YNnO+YHP/FnlxQ5PatkNjQ9Nib8ubYkKUzGgdEIYd8k=; b=fR9nUFVu86nH72IYbkbRk9WBKY
	odFxoj/uJ7+WWboZ75vzDEj5xLSXl68+S4y3vwFIn0ck+YOc5EHBvcy/8pNc/217hABcCpvtftzD8
	YCjCSY8prsZZpTb3d9rvKaFcaLng0QnbuYeyPIEp5d+PVz9D/JA+/BUdmN+laJHjckKzNlb6GkmGj
	1rZwruNpeqRjW6uVbq3EfhJfnWwRtJ9P4oRSanURsmxX1LKOfQVLBnM2mn58i8zjcdXUMnqXoz7UV
	L4Hw1uZ1TwTB5FA08xS/oiBu5UgbJEsCGrohlADHYZuy5vSjTO5AR7SZ0Rc40X/plqn+56rILdlHo
	NOLcNe7g==;
Received: from [219.240.46.135] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1s7W04-008jMi-0Y; Thu, 16 May 2024 09:58:04 +0200
From: Hyunjun Ko <zzoon@igalia.com>
To: quic_dikshita@quicinc.com
Cc: agross@kernel.org,
	andersson@kernel.org,
	bryan.odonoghue@linaro.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	quic_abhinavk@quicinc.com,
	quic_vgarodia@quicinc.com,
	stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH v2 00/34] Qualcomm video encoder and decoder driver
Date: Thu, 16 May 2024 16:57:32 +0900
Message-ID: <20240516075732.105878-1-zzoon@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for this series of patches. I successfully adjusted these patches and tried to test video features with gstreamer or ffmpeg.
But I found this provides staetful interfaces while I need stateless, which might cause an issue for my side..

My question is do you have any plan to implement stateless interfaces or already you have somewhere?




