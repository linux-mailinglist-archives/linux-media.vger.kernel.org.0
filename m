Return-Path: <linux-media+bounces-27514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B634DA4E98F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C7C57A3356
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B4F2BD5B6;
	Tue,  4 Mar 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flAqJQ5P"
X-Original-To: linux-media@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293F259CB6
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108702; cv=fail; b=IIN1aDTkZxsN9dZhtwBd5m1ASB5rdRasyt2ahord4ZBPqIqClzvW+Qh7zxauHFwkCxhuK1NHJ7b7fsYZzKAM/AdisEbdTvCWQ3FJ9IguQc/TNHzeIpZutSfsjis3EVo8hG1uJTpifOsnzrRv39JAskUF6A2RbwNK/mMmxBrO8wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108702; c=relaxed/simple;
	bh=Nz0QSW8xpqBQu9NgpTPdq1gpJYGAwudPcn+IwIuP8mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WjnzicIn4TZs/fQD/B13SG1dEiq/2YyMMMzbngbXZdi4qh0Ae0c7BtVJbxvg7mKlX65CRRcJT3b1+f40bhzMKdpGRwVhGaptcJO7RsTCg9gWjVCcY4HmIAWZAmeaIpYj2/yRfDu2BjA3r7impTekcNFyedbFqoSYujC/614m2X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flAqJQ5P reason="signature verification failed"; arc=none smtp.client-ip=170.10.133.124; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=fail smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id E34ED408B65C
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 20:18:18 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=flAqJQ5P
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gnd55KKzG2rM
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 19:17:41 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 4CD7342746; Tue,  4 Mar 2025 19:17:27 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flAqJQ5P
X-Envelope-From: <linux-kernel+bounces-541380-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flAqJQ5P
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id C4462436AC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:32:30 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 41F182DCE1
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:32:30 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03E0F169222
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA951F2BA1;
	Mon,  3 Mar 2025 10:30:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A41F1905
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997834; cv=none; b=I5uLvLqFdptlSz+B1FwMiQEW6tkYDmo3BJWuHq6eCxLsr8edTuqXzZTyeaGVg5D+3BUFV4SrmmKQ5DSI9B0Ze94PHzAIVmW4nn37qjgvr98Fex6jEdHRtTOCL+6+WljM+8jnhhu5NT84FqOhIqldNUY0br69WN22zNM9kKs4dpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997834; c=relaxed/simple;
	bh=Xd6jeKSTgIZFdafSVXZ/PdjL+vCFnUo1AZ/RbpdFGNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ka07ZgNjog9B2G12Dk48BC397zemyzti4c3PKIXzGBnF1v/PcM91Zy6fJSymKF6QvPnzgOW5G4cLgnReMLR61t/3Xa9793i5JV0wUdxiNni99tHKNTPQ9X0D8NqQcMXW8URHz6WAEQnyKs077i/hm5x3TVBT03vQCWrxeRR5Amw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flAqJQ5P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740997830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gR6zLqRG9S1za/uF+nzi2msUOEjaoJGIhx4NU2xJ4k0=;
	b=flAqJQ5P7bHVRs4k4HIxmVb7ZmmqFL8kFQoUA+kvIrVzsmoDKpolSOwvima/A/sZ8bGO84
	iURXi4TpwXJesUAzOFH+PQrH4/365xPrDTbYTtMNqBSGYBaWQ+Dh76G1mgTSbIlJq+EL2n
	TAERKDp157VjIp73e8BSy8KzhK4r3dg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-dbu1oVJVONOrbeNN23fqFQ-1; Mon, 03 Mar 2025 05:30:29 -0500
X-MC-Unique: dbu1oVJVONOrbeNN23fqFQ-1
X-Mimecast-MFC-AGG-ID: dbu1oVJVONOrbeNN23fqFQ_1740997828
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e4987b2107so4363108a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 02:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997828; x=1741602628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR6zLqRG9S1za/uF+nzi2msUOEjaoJGIhx4NU2xJ4k0=;
        b=MM7CeR36KGirDi87ET2gdDE9nRTdx1maqYtfKboCqd9myRULfihBG4sLrtZ7Bbsb2s
         1xUSAnERzNSLnBo/1EFJKdqEuujUU2JL6jkneF5Ly+BUv95MFerZ4WL7H5MT9Irjg9pQ
         7rimjeFoLSo2cimjo6teavZDZ8Qm/CYVkLoLD0jOra/fEkPshYaHE+SGTn/SHB5vjjwg
         txtaa9FEg1qGqAmWSewOxCqtyDwQ6dYKmO1B1llucBFUFUG/wqffyaoKuYa93SyIsip6
         BJ8SdQiHSqmuXDRDRg4Rf8v//GuhuzEJajIWLFfJ/BmCNZya6Wa8D25T9f1tqTJ+TRO7
         TlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZxX5cxkG8387zlBRcwaixvdurnIUsEUgYDaXlg0pGWNKw5ntq8O2LRbFgp/7vmleUS2oJ1iLseht6GL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyuJkNhqnho5Pr1lLWVw+DemRyRqzBjYdxyuWzq2tYinPCbD5w
	H6as+C2i1kutvlXk4CJ40VI7Z21TT7mJabcrlMqgGOx30aefIvLwYl41bfi5Cvlze4fsn/+aBQi
	HfzsBiHpqqtpu36tJclfyG24d2+/azi871mQODcnhqYlIrZQ2Bop/xhkBmKuAJQ==
X-Gm-Gg: ASbGncuIVKtj8uEZSm/t0GXmCdbsEY0xrNTzBv1lXdw9zvLMmRblraeL1MHgyFuzetT
	nWH0q+LW29nyW+desA+7X/f1elGRtLrxmm2sZgT50Eh3/xspODVdAIW6efe6Ycf18uu9DZ01KXB
	OrCH/5quHOqsKMCaRlIVBSFqGiDRZThhVI/mQ0dh6Ll0ja31fS4lnkg+l6LSm0aVKS9t6s6xBW8
	VDXBpAKO8o2SOkETEASs9mbXm2WAc/j7k4JUJo43y/yG24eIzTPjXjgzobLD2W6oVdV3SKUXiN6
	o+yfVb+bK8BKfT20AUWLZjxOGkbU+UvcI5EqfJw7ez4WWichjT3O/n0JOHOJd9Q=
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr5160410a12.16.1740997827216;
        Mon, 03 Mar 2025 02:30:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWOtveprrubC5jzCtCbdOt9xXXQloZV5gJJWnE6GooHlcrYwBVrf5NDmW5ksFomjWCc6RdKg==
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr5160377a12.16.1740997826443;
        Mon, 03 Mar 2025 02:30:26 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb4bd9sm6630165a12.33.2025.03.03.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:30:25 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] media: remove STA2x11 media pci driver
Date: Mon,  3 Mar 2025 11:30:22 +0100
Message-ID: <20250303103022.374705-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gnd55KKzG2rM
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741713399.07966@/G5D458c9PlM8dsqNDEdxw
X-ITU-MailScanner-SpamCheck: not spam

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

With commit dcbb01fbb7ae ("x86/pci: Remove old STA2x11 support"), the
STA2X11 Video Input Port driver is not needed and cannot be built anymore=

