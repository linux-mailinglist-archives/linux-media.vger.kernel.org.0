Return-Path: <linux-media+bounces-57197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIPyH782xmm7HgUAu9opvQ
	(envelope-from <linux-media+bounces-57197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:50:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E93409E4
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFA2304C106
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 07:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DB43CCFBA;
	Fri, 27 Mar 2026 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZhMqi0a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F5129D268
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597708; cv=none; b=Xly+4uLI8VcgqoKR0c808a62+r0rxGYVKyPKwd5eh71aNdOYt4nEl6x0dKUiYMFi8cjuCZuvehXQ7sMpRoK4JAn3Q1LcbqDtBeNZ0UWQmQ/bqPvc/gbk3rbAuVBE+Z41oiFJX+QIA5914t88htbCxOAF2kiP4TmpL9x6+T0CAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597708; c=relaxed/simple;
	bh=buffdZlpRpvl1pdzGDXhe9vAwC55peGRtfGgw+ibFUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqkMI5SPKYzFJBgBnpz//U58F7zZZVZcd/Ax2M9GSPh0EtFOELFDscD8yYGVKtkqjWZTKby536fnglmj36TQTYY7x1BK3Q5GSoKGM6DzjD+PSnGwLJ/E6TXDWOWUW989uonLinXHmongjcjLmJIKzaH5LfV+VD/FKoZ29D1O0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZhMqi0a; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so17528125e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774597699; x=1775202499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fj/sXT0MBVY8dwqBeJTNK45zDHX/R0Vgu5oPKLbp8Ys=;
        b=MZhMqi0a/6OR2BhRT7l9MyrG205fpmsKQ+msWx6XElkmyWDXS/ae84HZoikNCXfe8P
         3OTSW2iLcrQUe3AtQA4WsArCbajG1i49b22Xniqxz5O1upq3347/9WbkIvMbbPhyVKu7
         muEhkS5QvC8VZximBgnM/CIu1vxF835EjqS+Dg1JJOEhIDkFTOHJZafhZYPiiij31Ang
         RufLQMjFvsQWoUG182N4EEZeffHdIpwpGu8xb4qT9uqqLxFojEx23gkiZ1a1GY+5wHj7
         SUBe3ARtG/8jpo+TMC6KW7F5N6twEeMexsNSUQScbVRh1xCdZSbBJv89VqO8x0Ktdxe1
         raXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774597699; x=1775202499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj/sXT0MBVY8dwqBeJTNK45zDHX/R0Vgu5oPKLbp8Ys=;
        b=C7IdK5L34+OVa0mo/HYIheyD+OwIvehwqLlezp4DHD5BGnslKZ7S9twh36MxguVuYf
         ti8A0VG6G9RFwvuxQAbhgLJd/Dvz/4RB575WFclsIQ1iFo0Uu2bI3xjr7k+UjVq6yjkx
         E7Q6skKSJU/+mBrfH+r26rp9KC2Ig+Ax9Lzbu6C0cRs0pUFqkCtpIRg2HDZnh9twsMkF
         KAlPMK5Qkdz7yDiEJZbdt11YFsD6jHejFy7ZYI0wTJQoo+PmOswBp22TTCd7/4FZe8+C
         KNOphjFrtqCdenXCzZTniRI1NklepLkQvUXy6cCpJ1wbA5XjbG53Dtm3TukVl7MphsVJ
         9Acw==
X-Forwarded-Encrypted: i=1; AJvYcCUZAAdBZ07t08Vcx3TZcY1Rppy7xhsIAH6WdMdlngGqvHeRPcM7MILDifhdRkLoyhiDJBtdCC4iDidxgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVMbbCEsLGgPsgnxYhQIKNKPX5/xw1SYKj3ij1Gth8cjSRDV9z
	bBa1eP6HFX1XtZg0/hwnRRQaq9Bi1B5du7e+vo/6FL5yj0GQj3g+F1/9qqGJPs/+QGAFitVUg4u
	2DThK
X-Gm-Gg: ATEYQzza8agVgDAFdIBSIj+Nb44eMrTkatvHlaFC4TtqSbs2+THLdKwzeaAIo0vnhJZ
	9Y3nF+zOSi/x7iHH6epRWrLgqU8zMqRbL4w6T0VR/TnNT0IOp8JdotHXgrtKgv9CT3QHumqqXMY
	3BEceFN+Rn/5o87zzX3rNwJbLzf4oVRv6eDN56mIdlqTfcPd07TCxyswpZPwwxwdU7vGhRliZd3
	3vKaMc/10qysH5PZskin4KIgxdxmTWdeRBSWW221aemrXZ6DPMvHrmSEq2MNcOXQUDQ3ka3vS9K
	ar9DiU4XW3LAt4CFobLcZ0IXL4RNNohGAHzpQfP4kv5QIqggsLmwkPqqpt0nxKdjGgbwYSaPGUa
	+MqzB9udzIcAwjkDoaFMeax8srTA7bom/kAZSZ0U5ASJ6cXtrIwMSYbAyRi4ChGM1f/xw1ucYQw
	HdWUrhVhXK6R+KANRiqzkBWtOY8X9f
X-Received: by 2002:a05:600c:6287:b0:485:469f:5320 with SMTP id 5b1f17b1804b1-48727ef6865mr22737015e9.30.1774597698669;
        Fri, 27 Mar 2026 00:48:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271154d8sm14045775e9.9.2026.03.27.00.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 00:48:18 -0700 (PDT)
Date: Fri, 27 Mar 2026 10:48:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: media: atomisp: clean up
 ia_css_stream_destroy
Message-ID: <acY2P24KESCLXA2g@stanley.mountain>
References: <20260326213442.876745-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326213442.876745-1-azpijr@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57197-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 083E93409E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:34:06PM +0100, Jose A. Perez de Azpillaga wrote:
> This series fixes a loop shadowing bug and refactors the ISP2401 cleanup
> logic inside ia_css_stream_destroy().
> 
> Changes in v2:
> - Split the original patch into a 3-patch series as requested by
>   Dan Carpenter.
> - Added a Fixes tag for the loop shadowing bug.
> - Separated the extraction from the logical improvements.
> - Added clarification that assert() is a wrapper around BUG().

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


