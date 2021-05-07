Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC60E376184
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 09:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhEGH4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 03:56:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:15520 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229936AbhEGH4E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 May 2021 03:56:04 -0400
IronPort-SDR: JOQIFHLG2QcBQ9Ao0YDfAoUZGJM7756Hi8njoLBUfTUETdsnb/3+88gBQPCSKqPY9ul01Do1LV
 69TaqQ05IGFw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196657145"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="196657145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:55:02 -0700
IronPort-SDR: WaY1sNv/ukokJjPp8wct3T3eaLAIYMWYD6XbFJeXqKJmH6FT51vPPZIZ65FQsn0dz9oIjA2NDd
 i49gApZFjxbg==
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="434799232"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:55:00 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 63DEC203BC;
        Fri,  7 May 2021 10:54:58 +0300 (EEST)
Date:   Fri, 7 May 2021 10:54:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove useless breaks
Message-ID: <20210507075458.GB3@paasikivi.fi.intel.com>
References: <20210506200956.16593-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506200956.16593-1-paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

On Thu, May 06, 2021 at 11:09:56PM +0300, Pavel Skripkin wrote:
> Breaks are not useful after a return, they can
> simply be removed.
> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  .../pci/hive_isp_css_common/host/input_system.c       | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 0f5a231672a8..fd82997b11cc 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -904,16 +904,12 @@ static input_system_err_t input_system_configure_channel(
>  			break;
>  		case INPUT_SYSTEM_SOURCE_TPG:
>  			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -			break;
>  		case INPUT_SYSTEM_SOURCE_PRBS:
>  			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -			break;
>  		case INPUT_SYSTEM_SOURCE_FIFO:
>  			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;

While at it, you could drop the individual return statements, too. There
seems to be another such location at the end of the patch.

> -			break;
>  		default:
>  			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -			break;
>  		}
>  
>  		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
> @@ -995,7 +991,6 @@ static input_system_err_t input_buffer_configuration(void)
>  			default:
>  				config.csi_buffer_flags[port] |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
>  				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -				break;
>  			}
>  
>  			// Check acquisition buffer specified but set it later since it has to be unique.
> @@ -1032,7 +1027,6 @@ static input_system_err_t input_buffer_configuration(void)
>  
>  			default:
>  				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -				break;
>  			}
>  		} else {
>  			config.csi_buffer_flags[port] = INPUT_SYSTEM_CFG_FLAG_BLOCKED;
> @@ -1319,7 +1313,6 @@ static input_system_err_t configuration_to_registers(void)
>  
>  	default:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -		break;
>  
>  	} // end of switch (source_type)
>  
> @@ -1696,16 +1689,12 @@ static input_system_err_t input_system_configure_channel_sensor(
>  		break;
>  	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -		break;
>  	case INPUT_SYSTEM_XMEM_CAPTURE:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -		break;
>  	case INPUT_SYSTEM_XMEM_ACQUIRE:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -		break;
>  	default:
>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> -		break;
>  	}
>  	return INPUT_SYSTEM_ERR_NO_ERROR;
>  }

-- 
Regards,

Sakari Ailus
