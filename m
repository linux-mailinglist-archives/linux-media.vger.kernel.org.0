Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E213C33C0
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 14:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387421AbfJAMEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 08:04:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39601 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732695AbfJAME3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 08:04:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id w144so14140684oia.6;
        Tue, 01 Oct 2019 05:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rc80uNQCO5V74UZEUf3E2pBqivh12e4gIj5eJ05GnNc=;
        b=ttKi4CXEaVgBvGLJlj7E7q3Z274Xqcu/F6NsvVuIMBeJUkzSU5MF7QLgQKPOek5W+d
         9KPeWO2t61o9CI3LqsgcIGKrQ1R7GSGt08VVhe/S3Q06+mohp+SYp62nJbltmO/MBZz7
         nzd0ouq20ypXvUjbPpGR45HPm6Xd8r0nZxW4U65j/MvqEbmlAs/7XDhen66PT6aVIGX/
         5B9sRs/wPWj0nh40a8h26+QnYno0PhFQZPmYqwn9MWRbYAjDzEDQP7kQQ9zpHRIA/a+u
         p8yNmUBRzJbGaO9vjj7lKSG6Y/59j2XEFs6ymwTxxwgPAZstBs2rgor+LK697k1ZXYeh
         1ZcA==
X-Gm-Message-State: APjAAAXQt9fFkib4SAt5ACkrlywLeuSru3j8yXbT/TWJuiOEmUYqZ4aJ
        rPZxkR77+QQqnp7budd4+eUzB2zVSg==
X-Google-Smtp-Source: APXvYqwuwM7AkJVAtGa8akLZjV3Pru0RHcBtiuxx3c9KMgqDOsfLJ5O5/oMwqjvFDQHezJJYEcZysg==
X-Received: by 2002:a05:6808:8ee:: with SMTP id d14mr3311288oic.31.1569931468906;
        Tue, 01 Oct 2019 05:04:28 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 11sm4823374otg.62.2019.10.01.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:04:28 -0700 (PDT)
Date:   Tue, 1 Oct 2019 07:04:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Pragnesh Patel <pragnesh.patel@sifive.com>
Cc:     mripard@kernel.org, Pragnesh Patel <pragnesh.patel@sifive.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: Fix building error for
 dt_binding_check
Message-ID: <20191001120427.GA3594@bogus>
References: <1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 Sep 2019 17:31:00 +0530, Pragnesh Patel wrote:
> $id doesn't match the actual filename, so update the $id
> 
> Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
