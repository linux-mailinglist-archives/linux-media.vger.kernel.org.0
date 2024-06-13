Return-Path: <linux-media+bounces-13205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA9907853
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 18:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4421C23055
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 16:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB046130E40;
	Thu, 13 Jun 2024 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1D2YebV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA87381B0
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296383; cv=none; b=WtsPGjFpq+2RKuI5WOUfkIHpuOTeZHPiWrtShdkwTDPObhoUn99ZGgsdr1Y/uwymJBAesj0e7D+lUDchH8RPmPzdElfYJ4ODQLl45l1D2f4DY1lKDYSXiW7hY7/fDUpDhjUCSEiJpTruPHXdb9U2PO72a42kTkpenUY2o9sQxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296383; c=relaxed/simple;
	bh=jpdYtqNsXP+R+VlYakcDZROwc+GapZXHr/kjxyH1bfw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=K62grEVPq1y5FzDq6midbRajgjUBfcnRXXHLJjAaElpqd8PRcMQt+B67grQvQ9TmA46Maq5H13sjrS2oI5BFoZuhjhsEn+bv7+vqkmBVn8stcP3mN0/G1mwqYuHbrEHu92C/uBbdfM+k2v3rAFf/26D6yH0v09a8kGXZRJQ0HcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1D2YebV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35f1c490c13so1374831f8f.3
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718296380; x=1718901180; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jpdYtqNsXP+R+VlYakcDZROwc+GapZXHr/kjxyH1bfw=;
        b=e1D2YebVVU4qpAG9YyANT8sQbjUwfU5YJ+N4+rcMg4k6+v5sEx2VLRYtGgoYPrjYAA
         zPkOQL25sjqdBXTWFqowhT4TdQ4aC0fBlvXjobuMioXOtRCXPgJlP96IbgR7a+4uj9Ty
         dFKl8mzoCuYRXvDJTvC5WPNUG4ywRq07WGPJ7leSotgFqeKbXwXlFSJbEBf28lmc/hsK
         eQviEmaSE41GTLOsrE86FtDpVTyThBgcwcKxSVcbLZutIFtYQy+UUNxBfcUSk2+Unbu0
         bGO48GMbskp79tZCVKCRnwfGw3nAi9S1tkg+g/bRf39k9eMlR8HvWhLSsiqW9rv72qGA
         aJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718296380; x=1718901180;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpdYtqNsXP+R+VlYakcDZROwc+GapZXHr/kjxyH1bfw=;
        b=prEm9rIRju5q3ubiiTRITbojkyJqzRzXl3YldFM0otcWFP+IhbdY0Co3d49a0WHL9X
         VUzTt341X85rqIKKu0p9tnUznqTqpbyHhIr/2c3kbxWqehYqg6p+YJnw6v+ROI4Jxgqk
         hn2+/2OzDST+PtuAuu5QRNpKCAth+5mdOQ0hOZGcUaqP4f1frmF/BYjE5M6Wmrq8Vwbz
         rI9+9MHHRzSMrWtfzLTj92hX+VD8GEORTOQrU63ZhR6G0g2SoED5fb4jyr1/uddIkRch
         t78SQBpWoWmw2WchhvvPBkoYKCPIRf6AohiTd3S/bvxw2WEX6vkU5my/9MRFtrxTYz9M
         Lmww==
X-Gm-Message-State: AOJu0Yz/nBTMS+4RvkMXyqSknrohuvyaGaBLKY58rR6N2e6Zd65Pr6Cl
	ZbIiqltKgj3wpHuXxL8fzHMs3Qqg7y29ZWAHfmTm27YrAGlDAKTy/CnmPg==
X-Google-Smtp-Source: AGHT+IG5HRmX5hKu/nm/VLjr7ELwb+8ZZmM3eNROs1fx/iiMSu6NHB84q0ag3xaXVAdWCD5Y1gQqkw==
X-Received: by 2002:a5d:4e89:0:b0:35f:1d5e:e2ca with SMTP id ffacd0b85a97d-3607a7687c1mr183564f8f.39.1718296379990;
        Thu, 13 Jun 2024 09:32:59 -0700 (PDT)
Received: from DESKTOP-S8GDR12 ([39.46.196.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f224esm2149927f8f.66.2024.06.13.09.32.58
        for <linux-media@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 13 Jun 2024 09:32:59 -0700 (PDT)
Message-ID: <666b1f3b.df0a0220.64eb4.88a9@mx.google.com>
Date: Thu, 13 Jun 2024 09:32:59 -0700 (PDT)
X-Google-Original-Date: 13 Jun 2024 09:32:58 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: linus.americacustompackaging@gmail.com
To: linux-media@vger.kernel.org
Subject: Packaging Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,=0D=0A=0D=0AWe are a custom packaging company based in NewYork=
, NY.=0D=0A=0D=0AWe provide packaging services, such as custom pr=
inted boxes/labels and bags.=0D=0A=0D=0AWe provide these services=
 almost worldwide.=0D=0A=0D=0ASend over your artwork and confirm =
the quantity so I can assist you.=0D=0A=0D=0AThanks.=0D=0A=0D=0AB=
est Regards,=0D=0ALinus Brook=0D=0AAmerica Custom=0D=0APackaging,=
 LLC.


