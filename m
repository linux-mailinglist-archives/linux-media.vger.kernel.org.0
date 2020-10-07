Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0DD286179
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 16:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgJGOqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 10:46:12 -0400
Received: from mga11.intel.com ([192.55.52.93]:55094 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728641AbgJGOqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 10:46:12 -0400
IronPort-SDR: zMP886sSVrL4NKTfn/y+0Kd0F6MOtMS/n3Xiyr/1BplZ53IagtifNMpctzRG9ACyoY/VnSptdB
 ifQtmbssAiJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="161568974"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
   d="scan'208";a="161568974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 07:46:11 -0700
IronPort-SDR: 8JjyQQ2FMrv5i+nepNnY8+J6EP7chhXwrMiRJJHDttgBQfYl2Lvdh2vTqzWQ4dYoZ5MSDV4nV7
 2/Ecsy7o9Pog==
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
   d="scan'208";a="418718975"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 07:46:10 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A7891207B6; Wed,  7 Oct 2020 17:46:08 +0300 (EEST)
Date:   Wed, 7 Oct 2020 17:46:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 026/106] dt-bindings: mipi-ccs: Add bus-type for C-PHY
 support
Message-ID: <20201007144608.GM26842@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084505.25761-8-sakari.ailus@linux.intel.com>
 <20201007135225.GA125839@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007135225.GA125839@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Wed, Oct 07, 2020 at 08:52:25AM -0500, Rob Herring wrote:
> On Wed, 07 Oct 2020 11:45:03 +0300, Sakari Ailus wrote:
> > The bus-type property is required for C-PHY support. Add it, including
> > values for CCP2 and CSI-2 D-PHY.
> > 
> > Also require the bus-type property. Effectively all new sensors are MIPI
> > D-PHY or C-PHY that cannot be told apart without the bus-type property.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../devicetree/bindings/media/i2c/mipi-ccs.yaml          | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
>   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
>   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
>   in "<unicode string>", line 89, column 13
> found a tab character that violates indentation
>   in "<unicode string>", line 90, column 1
> make[1]: *** [Documentation/devicetree/bindings/Makefile:18: Documentation/devicetree/bindings/media/i2c/mipi-ccs.example.dts] Error 1
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/i2c/mipi-ccs.example.dts'
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:  while scanning a plain scalar
>   in "<unicode string>", line 89, column 13
> found a tab character that violates indentation
>   in "<unicode string>", line 90, column 1
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml: ignoring, error parsing file
> warning: no schema found in file: ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> make: *** [Makefile:1366: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1377845
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

I tested this but somehow I managed to change it after testing it. :-)

I'll resend in a moment.

-- 
Kind regards,

Sakari Ailus
