Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EBD7AF193
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 19:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjIZRKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 13:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjIZRKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 13:10:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E30610E;
        Tue, 26 Sep 2023 10:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695748215; x=1727284215;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TfH/sBXCR5h8l260j/engV3lxANMpH7MxSXxh5ytovE=;
  b=fCfJILCzUtyLN8OfVixQrdK2oqd8rlMKFC1BNU5XHXK3ulcjZvU1HIcD
   NgABrSqKO7+eNvHMh/RENvBsOLpPx64dWjzS1nK2OeXyQTEfzc2Ej8NWz
   KfFYMyZS9JMVOrxf/EawxIKVwf8hcjzMTskISani7yL50r4GOftYg8XwE
   m8mTfvyEkt+dt7dI+t4TCQP1la/tKj1qlRN2HQJ28QN4hNcNmfO2T4LSv
   9Gkey/zx1e2DdyLdq1KF5I+yk3+FnNXT0cTSHsBvlseL6nQPe6sT//8YT
   mND9udp1e0cN1EXu3fmmQ5UzN7mVrBzkz/SPB/ta8eedZE4xgdGgYesFF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445750505"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445750505"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814549087"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="814549087"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2023 10:10:11 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlBZZ-00039I-1w;
        Tue, 26 Sep 2023 17:10:09 +0000
Date:   Wed, 27 Sep 2023 01:09:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 14/41] htmldocs:
 Documentation/userspace-api/media/glossary.rst:17: WARNING: term not in
 glossary: device driver
Message-ID: <202309270103.2q3vRm1E-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   680ea5964952e120a32644bb7751dd9aa3658ff9
commit: 5cdd8985137ace945df352aa8db5c80e2a6921d8 [14/41] media: uapi: Add generic serial metadata mbus formats
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270103.2q3vRm1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270103.2q3vRm1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/media/glossary.rst:17: WARNING: term not in glossary: device driver
>> Documentation/userspace-api/media/glossary.rst:47: WARNING: term not in glossary: media hardware
>> Documentation/userspace-api/media/glossary.rst:55: WARNING: term not in glossary: microprocessor
>> Documentation/userspace-api/media/glossary.rst:61: WARNING: term not in glossary: ic
>> Documentation/userspace-api/media/glossary.rst:67: WARNING: term not in glossary: i²c
>> Documentation/userspace-api/media/glossary.rst:67: WARNING: term not in glossary: spi
>> Documentation/userspace-api/media/glossary.rst:67: WARNING: term not in glossary: ip block
>> Documentation/userspace-api/media/glossary.rst:67: WARNING: term not in glossary: soc
>> Documentation/userspace-api/media/glossary.rst:67: WARNING: term not in glossary: fpga
>> Documentation/userspace-api/media/glossary.rst:72: WARNING: term not in glossary: hardware component
>> Documentation/userspace-api/media/glossary.rst:72: WARNING: term not in glossary: isp
>> Documentation/userspace-api/media/glossary.rst:78: WARNING: term not in glossary: peripheral
>> Documentation/userspace-api/media/glossary.rst:122: WARNING: term not in glossary: digital tv api
>> Documentation/userspace-api/media/glossary.rst:123: WARNING: term not in glossary: mc api
>> Documentation/userspace-api/media/glossary.rst:124: WARNING: term not in glossary: rc api
>> Documentation/userspace-api/media/glossary.rst:159: WARNING: term not in glossary: hardware peripheral
>> Documentation/userspace-api/media/glossary.rst:197: WARNING: term not in glossary: device node

vim +17 Documentation/userspace-api/media/glossary.rst

127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   15  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   16      Bridge Driver
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  @17  	A :term:`Device Driver` that implements the main logic to talk with
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   18  	media hardware.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   19  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   20      CEC API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   21  	**Consumer Electronics Control API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   22  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   23  	An API designed to receive and transmit data via an HDMI
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   24  	CEC interface.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   25  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   26  	See :ref:`cec`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   27  
5cdd8985137ace Sakari Ailus          2023-04-25   28  .. _media-glossary-data-unit:
5cdd8985137ace Sakari Ailus          2023-04-25   29  
5cdd8985137ace Sakari Ailus          2023-04-25   30      Data unit
5cdd8985137ace Sakari Ailus          2023-04-25   31  
5cdd8985137ace Sakari Ailus          2023-04-25   32  	Unit of data transported by a bus. On parallel buses, this is called a
5cdd8985137ace Sakari Ailus          2023-04-25   33  	sample while on serial buses the data unit is logical. If the data unit
5cdd8985137ace Sakari Ailus          2023-04-25   34  	is image data, it may also be called a pixel.
5cdd8985137ace Sakari Ailus          2023-04-25   35  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   36      Device Driver
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   37  	Part of the Linux Kernel that implements support for a hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   38  	component.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   39  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   40      Device Node
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   41  	A character device node in the file system used to control and
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   42  	transfer data in and out of a Kernel driver.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   43  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   44      Digital TV API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   45  	**Previously known as DVB API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   46  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  @47  	An API designed to control a subset of the :term:`Media Hardware`
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   48  	that implements	digital TV (e. g. DVB, ATSC, ISDB, etc).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   49  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   50  	See :ref:`dvbapi`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   51  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   52      DSP
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   53          **Digital Signal Processor**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   54  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  @55  	A specialized :term:`Microprocessor`, with its architecture
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   56  	optimized for the operational needs of digital signal processing.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   57  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   58      FPGA
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   59  	**Field-programmable Gate Array**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   60  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  @61  	An :term:`IC` circuit designed to be configured by a customer or
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   62  	a designer after manufacturing.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   63  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   64  	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   65  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   66      Hardware Component
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  @67  	A subset of the :term:`Media Hardware`. For example an :term:`I²C` or
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   68  	:term:`SPI` device, or an :term:`IP Block` inside an
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   69  	:term:`SoC` or :term:`FPGA`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   70  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   71      Hardware Peripheral
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  @72  	A group of :term:`hardware components <Hardware Component>` that
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   73  	together make a larger user-facing functional peripheral. For
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   74  	instance, the :term:`SoC` :term:`ISP` :term:`IP Block`
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   75  	and the external camera sensors together make a camera hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   76  	peripheral.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   77  
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  @78  	Also known as :term:`Peripheral`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   79  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   80      I²C
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   81  	**Inter-Integrated Circuit**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   82  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   83  	A  multi-master, multi-slave, packet switched, single-ended,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   84  	serial computer bus used to control some hardware components
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   85  	like sub-device hardware components.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   86  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   87  	See http://www.nxp.com/docs/en/user-guide/UM10204.pdf.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   88  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   89      IC
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   90  	**Integrated circuit**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   91  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   92  	A set of electronic circuits on one small flat piece of
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   93  	semiconductor material, normally silicon.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   94  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   95  	Also known as chip.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   96  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   97      IP Block
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   98  	**Intellectual property core**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   99  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  100  	In electronic design a semiconductor intellectual property core,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  101  	is a reusable unit of logic, cell, or integrated circuit layout
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  102  	design that is the intellectual property of one party.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  103  	IP Blocks may be licensed to another party or can be owned
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  104  	and used by a single party alone.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  105  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  106  	See https://en.wikipedia.org/wiki/Semiconductor_intellectual_property_core).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  107  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  108      ISP
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  109  	**Image Signal Processor**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  110  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  111  	A specialized processor that implements a set of algorithms for
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  112  	processing image data. ISPs may implement algorithms for lens
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  113  	shading correction, demosaicing, scaling and pixel format conversion
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  114  	as well as produce statistics for the use of the control
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  115  	algorithms (e.g. automatic exposure, white balance and focus).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  116  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  117      Media API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  118  	A set of userspace APIs used to control the media hardware. It is
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  119  	composed by:
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  120  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  121  	  - :term:`CEC API`;
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25 @122  	  - :term:`Digital TV API`;
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25 @123  	  - :term:`MC API`;
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25 @124  	  - :term:`RC API`; and
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  125  	  - :term:`V4L2 API`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  126  
d759cd46b9f151 Mauro Carvalho Chehab 2021-06-05  127  	See Documentation/userspace-api/media/index.rst.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  128  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  129      MC API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  130  	**Media Controller API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  131  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  132  	An API designed to expose and control the relationships between
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  133  	multimedia devices and sub-devices.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  134  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  135  	See :ref:`media_controller`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  136  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  137      MC-centric
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  138  	:term:`V4L2 Hardware` device driver that requires :term:`MC API`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  139  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  140  	Such drivers have ``V4L2_CAP_IO_MC`` device_caps field set
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  141  	(see :ref:`VIDIOC_QUERYCAP`).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  142  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  143  	See :ref:`v4l2_hardware_control` for more details.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  144  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  145      Media Hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  146  	Subset of the hardware that is supported by the Linux Media API.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  147  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  148  	This includes audio and video capture and playback hardware,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  149  	digital and analog TV, camera sensors, ISPs, remote controllers,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  150  	codecs, HDMI Consumer Electronics Control, HDMI capture, etc.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  151  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  152      Microprocessor
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  153  	Electronic circuitry that carries out the instructions of a
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  154  	computer program by performing the basic arithmetic, logical,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  155  	control and input/output (I/O) operations specified by the
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  156  	instructions on a single integrated circuit.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  157  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  158      Peripheral
1c16b009018deb Mauro Carvalho Chehab 2020-09-25 @159  	The same as :term:`Hardware Peripheral`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  160  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  161      RC API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  162  	**Remote Controller API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  163  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  164  	An API designed to receive and transmit data from remote
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  165  	controllers.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  166  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  167  	See :ref:`remote_controllers`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  168  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  169      SMBus
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  170  	A subset of I²C, which defines a stricter usage of the bus.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  171  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  172      SPI
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  173  	**Serial Peripheral Interface Bus**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  174  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  175  	Synchronous serial communication interface specification used for
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  176  	short distance communication, primarily in embedded systems.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  177  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  178      SoC
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  179  	**System on a Chip**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  180  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  181  	An integrated circuit that integrates all components of a computer
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  182  	or other electronic systems.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  183  
854705aa23fda9 Sakari Ailus          2023-04-24  184  _media-glossary-stream:
854705aa23fda9 Sakari Ailus          2023-04-24  185      Stream
854705aa23fda9 Sakari Ailus          2023-04-24  186  	A distinct flow of data (image data or metadata) over a media pipeline
854705aa23fda9 Sakari Ailus          2023-04-24  187  	from source to sink. A source may be e.g. an image sensor and a sink
854705aa23fda9 Sakari Ailus          2023-04-24  188  	e.g. a memory buffer.
854705aa23fda9 Sakari Ailus          2023-04-24  189  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  190      V4L2 API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  191  	**V4L2 userspace API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  192  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  193  	The userspace API defined in :ref:`v4l2spec`, which is used to
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  194  	control a V4L2 hardware.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  195  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  196      V4L2 Device Node
1c16b009018deb Mauro Carvalho Chehab 2020-09-25 @197  	A :term:`Device Node` that is associated to a V4L driver.

:::::: The code at line 17 was first introduced by commit
:::::: 1c16b009018debb34d2abc4525fd5ad434831343 media: glossary.rst: use the right case for glossary entries

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
