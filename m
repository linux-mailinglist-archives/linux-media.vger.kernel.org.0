Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5AB376616
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 15:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237152AbhEGN0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 09:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhEGN0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 09:26:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C25C061574;
        Fri,  7 May 2021 06:25:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t11so12695181lfl.11;
        Fri, 07 May 2021 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PeLUHJQhHafSOnUtd2Jot7lMTFiZHm+D+093EiTNlA=;
        b=uLpN7v79weERwjQMbWIwY/HGCOQARW/GpVosm7pk5Zj411X4HyUDofuJeL7rfEclUy
         MRxnvCXtRRX9d/PILHy5KNjquNKZXovakfKES4txVNrgsgsLYVXs0iIUV5hBtlIkhzTS
         oyFR5GJvuR0LTXbr+JTWjtx8uEGSTBIYLmNHUcJKiLjW7FgpF3hvODi5v2Hacfhk6C30
         TOK8j8tcRnbnhMVmFXXgCSCdI4M60Vhuo0gLeBKd5K7dy3WNkeYLEL1WR09Odxkggahr
         LHjzeGNLzbHF1llS5VtgyNFEVN8S+W0g6nZIPufltG6EgMJI9sz9/5h7YSt4gyR2pBeF
         s1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PeLUHJQhHafSOnUtd2Jot7lMTFiZHm+D+093EiTNlA=;
        b=WBC6ys0QoFHcATgPhCVkFRsaWl4EfiFRHNqJbMNXfXxffQQudV+Ss70AxJBrVvehWE
         QzfGQt6vuHqJYsetkR7f9ed6hu5G8tAsaLSPd0lv6IDAtmVq+wDoMDhhZ4XOuURTYAmR
         ePfh8H06Jr+hdbLi2THoe2VM3Q3I634Lzn3WAumqZT1a8PE5aVGyICCR+f5aPk66feaE
         mFOWyW+AmcqTPWrQgJz+dnNUUBoPruy/tFyVPjO71+cu7T64mk6IFBYQyL4SLaF0pV2T
         VJCNjCVud3FCVnMEQENTQqUGn4e57hWIhUnyFieKPhWq6XxyHq/Wwqlf6HBGyrX5r+lB
         tDYA==
X-Gm-Message-State: AOAM530vh1dlk62O+JUiNaWn4+kffbDcCr6WhxAuCeM8DV5YHBFZvC6S
        MfvE0eoLKxquY9v3HSXXSW8=
X-Google-Smtp-Source: ABdhPJy/h1Gbyc1tU+47sqjrJ/ShH870zU/Ty3eFKaJmOTFwobrSRs3Cbruw8WHlCIn15ze8uu4TMg==
X-Received: by 2002:a05:6512:b8e:: with SMTP id b14mr6332327lfv.404.1620393912378;
        Fri, 07 May 2021 06:25:12 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.84])
        by smtp.gmail.com with ESMTPSA id f20sm1368069lfs.161.2021.05.07.06.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 06:25:12 -0700 (PDT)
Date:   Fri, 7 May 2021 16:25:09 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove useless breaks
Message-ID: <20210507162509.355188f4@gmail.com>
In-Reply-To: <20210507075458.GB3@paasikivi.fi.intel.com>
References: <20210506200956.16593-1-paskripkin@gmail.com>
        <20210507075458.GB3@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 7 May 2021 10:54:58 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

Hi, Sakari!

> Hi Pavel,
> 
> On Thu, May 06, 2021 at 11:09:56PM +0300, Pavel Skripkin wrote:
> > Breaks are not useful after a return, they can
> > simply be removed.
> > 
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > ---
> >  .../pci/hive_isp_css_common/host/input_system.c       | 11
> > ----------- 1 file changed, 11 deletions(-)
> > 
> > diff --git
> > a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> > b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> > index 0f5a231672a8..fd82997b11cc 100644 ---
> > a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> > +++
> > b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> > @@ -904,16 +904,12 @@ static input_system_err_t
> > input_system_configure_channel( break; case
> > INPUT_SYSTEM_SOURCE_TPG: return
> > INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -			break;
> >  		case INPUT_SYSTEM_SOURCE_PRBS:
> >  			return
> > INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -			break;
> >  		case INPUT_SYSTEM_SOURCE_FIFO:
> >  			return
> > INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> 
> While at it, you could drop the individual return statements, too.
> There seems to be another such location at the end of the patch.
>

Good catch, I will remove them in v2.

Also, I noticed, that there are returns in the end of void functions.
Can I remove them too in v2, or it should be done as another patch? 

> > -			break;
> >  		default:
> >  			return
> > INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -			break;
> >  		}
> >  
> >  		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return
> > error; @@ -995,7 +991,6 @@ static input_system_err_t
> > input_buffer_configuration(void) default:
> >  				config.csi_buffer_flags[port] |=
> > INPUT_SYSTEM_CFG_FLAG_CONFLICT; return
> > INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -				break;
> >  			}
> >  
> >  			// Check acquisition buffer specified but
> > set it later since it has to be unique. @@ -1032,7 +1027,6 @@
> > static input_system_err_t input_buffer_configuration(void) 
> >  			default:
> >  				return
> > INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -				break;
> >  			}
> >  		} else {
> >  			config.csi_buffer_flags[port] =
> > INPUT_SYSTEM_CFG_FLAG_BLOCKED; @@ -1319,7 +1313,6 @@ static
> > input_system_err_t configuration_to_registers(void) 
> >  	default:
> >  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -		break;
> >  
> >  	} // end of switch (source_type)
> >  
> > @@ -1696,16 +1689,12 @@ static input_system_err_t
> > input_system_configure_channel_sensor( break;
> >  	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
> >  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -		break;
> >  	case INPUT_SYSTEM_XMEM_CAPTURE:
> >  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -		break;
> >  	case INPUT_SYSTEM_XMEM_ACQUIRE:
> >  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -		break;
> >  	default:
> >  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> > -		break;
> >  	}
> >  	return INPUT_SYSTEM_ERR_NO_ERROR;
> >  }
> 




With regards,
Pavel Skripkin
