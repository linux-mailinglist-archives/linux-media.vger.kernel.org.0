Return-Path: <linux-media+bounces-34597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A5AD6C5F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08C2C2C004C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2235E22B8A1;
	Thu, 12 Jun 2025 09:36:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566431F583D;
	Thu, 12 Jun 2025 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721015; cv=none; b=DHUS0CkNkaM4fyTvvhQY3cBqgX2fjK4R1WnSOE+Z/mmFyN9ioIhWmxZeAIYehyz7SUBpNSnVDk5j6v6IkxN+99vIBbtEL5WDNt7PcqNamnwoujagIDxItxICh4xP4K8Lp1QaOMY4s+dKQIuNdyl5kYOeOE1hja4+P2dXCkUD/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721015; c=relaxed/simple;
	bh=zzNM1NRpWtTljNxxKqwlEBrzD8clwdhi+hEHCOXqPPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYU0O1YPDB/P55q74Ujrjmln6knOOs3QRLHZpIe0G5L8lqm1qEIWFQRWnKQ/dFkzvyYmBSrW1KFjtzODJ7LuRODi+Rsv/UR0D5+0LppowFjA78y0dVc5Jeef3N2aHK7hTt0uIKxDNADUmfj/WsykDUkFTNnOuU6KQiPh5J8A0f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-527a2b89a11so287989e0c.2;
        Thu, 12 Jun 2025 02:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721012; x=1750325812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlKXKGVlwoBPp0PAkcRb9oaTjUaq4FXxnfqiTqHWy3A=;
        b=UBWbS9UadkQzq4enQ+bLMqY4YFV8sDHfL9h1RhaV8FKvhtencOOmJPvnYfzkep6gzJ
         VvYwFoDhpcVeCtTWdvR8/Tp1hhuTkhxHUTolSVdi+RHEt8B/ioieQpJCM3kpbm7qWfCK
         7U4IgCX3KomIbLJHbLByM0J+UfXAkPeyWax3GW8ZKRmmrcdwnxo53UOxjH88v0+/INq7
         Y9lL0MU+IDwpxjYOXAHLvhzEZw1/7i1bfrRcjs/w+81UDhBihN4QBwpE6/SW6P3ShloA
         V96bK1XbD/R22ggUfHOnQtI/Wr1PhuTrjfEIt8FnEWSEyDI65czmrCEa54lUCjsgXXBu
         MA+w==
X-Forwarded-Encrypted: i=1; AJvYcCUPJXOcj1uUthccqZ6jEmM9KycXUjDPlTT9v40QJtFhksifp6CcqoHYVSzJnhdLU9ITAW1t+jwGzecMGYb9Nc59rME=@vger.kernel.org, AJvYcCVzJ1eNer9GNGdXApse5hpGDSDEjW9usZJTQndlirJ14xNlbkYu+w4W0POoT63vnxG5Zzsyl8ga25By+qo=@vger.kernel.org, AJvYcCWLBV+aKTm3HvAGNbhl9K+RR9hlDEeSBxm0rKeDw7Y7WPD7GvYtolewSL3pDSVsaZS1wwJmwIU0B+2RplM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnd8rXug/jDUqOsdAhdMHjNMNHGhU+3FeQIhfaaqoum0RDwGXC
	dz4ccuyNHbK/Cx1pT1dLu/glUcWdQzXLHSaSHP9ar4FntYU06pnVVx8Ly5D9P66P
X-Gm-Gg: ASbGnct0TAbqhZRCsjydpCJ2Q6MbCJdJ4v2Ldh8/t6cpfyHuP+3N40Vg6QMZ7h6+7zw
	tD64uD+HdcRoaF1g+dVcpx9T1TBHIn2oWGL5nBIprMeQFKCfAPU8hDB5b6ISxtQEy5mBGHdwe7F
	YrgGU5XDFVicLCcH01qACnG2OmFqOhFs9lYPgg5iZX778PcPu8SMpdoWH4JRcxuBTsxhstOVOPl
	/BFoX1wRERzn7nlH6dYErmsOeQaglm658D8RbtOdZLQiXLmv0xDDG1POh4LUbnv0oDKSYC85cta
	QFGRKXwRrQosJShFOeEHK/ssRgweNeaPte6dHN2dXqLhZsEJikJIWaIoRBMJdcVd712n1IJmKve
	cw4+ulHf7uWMXvi21vUC5q7/E
X-Google-Smtp-Source: AGHT+IE7G3+nzLIpxcptvLHLTiA+tKRj0R3+LBkMd4mPtM4xHC0/iJ0GLeVpBwedX8XExy8z2nX96A==
X-Received: by 2002:a05:6122:1d9f:b0:531:2afc:461c with SMTP id 71dfb90a1353d-5312afc4de3mr4328581e0c.7.1749721011791;
        Thu, 12 Jun 2025 02:36:51 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f670ae2sm226427e0c.38.2025.06.12.02.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 02:36:51 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4c9cea30173so177554137.3;
        Thu, 12 Jun 2025 02:36:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR6OoZXJKTGqjpsKEnJ7HRdvJGKBNWCyJu8CvAz6Ea53Dp5WLteQ2PhqMfgUJ6ajIBZQrzMIcGzI9r/mw=@vger.kernel.org, AJvYcCXtB2uGn4VIGkQJgn5cQFoS2VZCJrwSD/Gvm2owo1hpb50E3nRfak1hH4rjVaouvKcKpoRLDZ/JB4x1a+yorzdccgo=@vger.kernel.org, AJvYcCXxDaixyf+2H1HRXCwZ/1XvENovbubVnEVMgKf4mRKSRjHtofhid4mniFqDeJndoSBm9fJ6Id8BcbVmxmQ=@vger.kernel.org
X-Received: by 2002:a05:6102:4b8b:b0:4e4:5ed0:19bb with SMTP id
 ada2fe7eead31-4e7bafda80fmr6504211137.22.1749721011180; Thu, 12 Jun 2025
 02:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com> <20250611232956.GQ24465@pendragon.ideasonboard.com>
In-Reply-To: <20250611232956.GQ24465@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 11:36:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm2KCea7yJc5O3M13XemzTYwB9+2zxGrwD0O7UVA+vRg@mail.gmail.com>
X-Gm-Features: AX0GCFuSWiY9GrYiJHYatrVtXsEGNwmZ1WJ7mSFq_nJisU5eexe41JDPFmO9OmE
Message-ID: <CAMuHMdWm2KCea7yJc5O3M13XemzTYwB9+2zxGrwD0O7UVA+vRg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
	LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 09:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jun 09, 2025 at 09:01:43PM +0200, Jacopo Mondi wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >
> > According to H/W manual v1.00, VSPD must be excecuted
> > FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
> > VSPDL is not applicable.
>
> According to the R-Car Gen3 H/W manual v1.00, the FCP must be reset
> after resetting the VSPD, except for the VSPDL. Do so.

And s/Reset FCP for VSPD/Reset FCP after VSPD/g in the one-line
summary.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

